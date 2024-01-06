import 'package:coinite/data/models/crypto_model.dart';
import 'package:coinite/data/models/crypto_model_impl.dart';
import 'package:coinite/data/vo/crypto_vo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  CryptoModel cryptoModel = CryptoModelImpl();
  List<CryptoVO>? cryptoList;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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
}
