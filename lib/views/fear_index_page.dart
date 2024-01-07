import 'package:coinite/controllers/fear_index_controller.dart';
import 'package:coinite/resources/dimens.dart';
import 'package:coinite/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:speedometer_chart/speedometer_chart.dart';

import '../widgets/fear_index_chart.dart';

class FearIndexPage extends StatelessWidget {
  final FearIndexController controller = Get.put(FearIndexController());

  @override
  Widget build(BuildContext context) {
    controller.fetchData();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_2,
        vertical: MARGIN_MEDIUM,
      ),
      child: Obx(
        () {
          return controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(title: "Crypto Fear and Greed Index"),
                    SizedBox(height: MARGIN_XLARGE),
                    Center(
                      child: SpeedometerChart(
                        dimension: 350,
                        minValue: 0,
                        maxValue: 100,
                        value: controller.todayFearIndexValue.value,
                        graphColor: [Colors.red, Colors.yellow, Colors.green],
                        pointerWidth: 20,
                        valueVisible: false,
                        rangeVisible: false,
                        animationDuration: 1,
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            controller.today!.value,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: TEXT_REGULAR_3X,
                            ),
                          ),
                          Text(
                            controller.today!.valueClassification,
                            style: TextStyle(
                              fontSize: TEXT_REGULAR_3X,
                              fontWeight: FontWeight.bold,
                              color: controller.getIndexColor(
                                controller.today!.valueClassification,
                              ),
                            ),
                          ),
                          SizedBox(height: MARGIN_MEDIUM_2),
                          Text("The next update will happen in :"),
                          Text(controller.timeUpdateRx.value),
                        ],
                      ),
                    ),
                    SizedBox(height: MARGIN_LARGE),
                    Text(
                      "30-Day Crypto Fear Index Chart",
                      style: TextStyle(
                          fontSize: TEXT_REGULAR_3X,
                          fontWeight: FontWeight.bold,
                          color: Colors.white54),
                    ),
                    SizedBox(height: MARGIN_MEDIUM_3),
                    FearIndexChart(fearList: controller.fearList)
                  ],
                );
        },
      ),
    );
  }
}
