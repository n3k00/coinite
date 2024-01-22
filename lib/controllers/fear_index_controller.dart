import 'dart:async';

import 'package:coinite/data/models/crypto_model.dart';
import 'package:coinite/data/models/crypto_model_impl.dart';
import 'package:coinite/data/vo/fear_vo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FearIndexController extends GetxController {
  CryptoModel cryptoModel = CryptoModelImpl();
  var fearList = <FearVO>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  void fetchData() {
    try {
      cryptoModel.getFearIndexList(30).then((list) {
        fearList.assignAll(list);
      });
    } catch (error) {
      // Handle the error, you can log it or show an error message
      print('Error fetching data: $error');
    }
  }

  Color getIndexColor(String value) {
    if (value == "Extreme Fear") {
      return Colors.red;
    } else if (value == "Fear") {
      return Colors.orange;
    } else if (value == "Neutral") {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  String getNextTime(String? timeUntilUpdate) {
    // Convert timeUntilUpdate to seconds and parse it as an integer
    int timeInSeconds = int.tryParse(timeUntilUpdate!) ?? 0;

    // Calculate hours and minutes
    int hours = (timeInSeconds ~/ 3600) % 24;
    int minutes = (timeInSeconds ~/ 60) % 60;

    // Construct the formatted time string
    String formattedTime = '$hours hours , $minutes minutes';
    return formattedTime;
  }

  double getTodayValue(String value) {
    return double.parse(value);
  }
}
