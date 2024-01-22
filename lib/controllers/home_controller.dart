import 'package:coinite/data/models/crypto_model.dart';
import 'package:coinite/data/models/crypto_model_impl.dart';
import 'package:coinite/data/vo/crypto_vo.dart';
import 'package:coinite/network/data_agents/retrofit_data_agent_impl.dart';
import 'package:coinite/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  CryptoModel cryptoModel = CryptoModelImpl();
  List<CryptoVO>? cryptoList;
  var isSearch = false.obs;
  RxString searchString = ''.obs;

  /// Detail Page
  var box = GetStorage("recipes");
  RxBool isFavorite = false.obs;
  RxList<CryptoVO> favList = <CryptoVO>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchFavoriteList();
  }

  String stringToDoubleAsFixFour(double value) {
    if (value < 0.9) {
      return value.toStringAsFixed(4);
    }
    return value.toStringAsFixed(2);
  }

  Widget get24HoursChange(double? value) {
    if (value! < 0) {
      return Text(
        "${value.toStringAsFixed(2)} %",
        style: TextStyle(color: Colors.red, fontSize: 16),
      );
    } else if (value < 10) {
      return Text(
        " ${value.toStringAsFixed(2)} %",
        style: TextStyle(color: Colors.green, fontSize: 16),
      );
    } else {
      return Text(
        " ${value.toStringAsFixed(1)} %",
        style: TextStyle(color: Colors.green, fontSize: 16),
      );
    }
  }

  void toSearch(String search) {
    searchString.value = search;
  }

  void changeSearch() {
    isSearch.value = !isSearch.value;
  }

  void checkFavorite(CryptoVO crypto) async {
    List<CryptoVO>? favoritesList = favList.toList();
    bool isTrue =
        favoritesList.any((fav) => fav.websiteSlug == crypto.websiteSlug);
    isFavorite.value = isTrue;
  }

  void toggleButton(crypto) {
    List<CryptoVO>? favoritesList = favList.toList();
    bool isCheck =
        favoritesList.any((fav) => fav.websiteSlug == crypto.websiteSlug);
    if (isCheck) {
      favoritesList.removeWhere((fav) => fav.websiteSlug == crypto.websiteSlug);
    } else {
      favoritesList.add(crypto);
    }
    box.write("favorite", favoritesList);
    isFavorite.value = !isCheck;
    fetchFavoriteList();
  }

  void fetchFavoriteList() {
    List<CryptoVO>? favoritesList = box.read<List<CryptoVO>>("favorite") ?? [];
    favList.assignAll(favoritesList);
  }
}
