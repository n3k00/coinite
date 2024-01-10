import 'package:coinite/controllers/fear_index_controller.dart';
import 'package:coinite/data/models/crypto_model_impl.dart';
import 'package:coinite/data/vo/fear_vo.dart';
import 'package:coinite/resources/dimens.dart';
import 'package:coinite/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(title: "Crypto Fear and Greed Index"),
          SizedBox(height: MARGIN_XLARGE),
          FutureBuilder(
            future: CryptoModelImpl().getFearIndexList(30),
            builder:
                (BuildContext context, AsyncSnapshot<List<FearVO>> snapshot) {
              if (snapshot.hasData) {
                return showFearData(snapshot);
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (!snapshot.hasData) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ));
              }
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Column showFearData(AsyncSnapshot<List<FearVO>> snapshot) {
    return Column(
      children: [
        SpeedometerChart(
          dimension: 350,
          minValue: 0,
          maxValue: 100,
          value: controller.getTodayValue(snapshot.data![0].value),
          graphColor: [Colors.red, Colors.yellow, Colors.green],
          pointerWidth: 20,
          valueVisible: false,
          rangeVisible: false,
          animationDuration: 1,
        ),
        Text(
          snapshot.data![0].value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: TEXT_REGULAR_3X,
          ),
        ),
        Text(
          snapshot.data![0].valueClassification,
          style: TextStyle(
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.bold,
            color: controller.getIndexColor(
              snapshot.data![0].valueClassification,
            ),
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Text("The next update will happen in :"),
        Text(
          controller.getNextTime(
            snapshot.data![0].timeUntilUpdate,
          ),
        ),
        SizedBox(height: MARGIN_LARGE),
        Text(
          "30-Day Crypto Fear Index Chart",
          style: TextStyle(
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.bold,
            color: Colors.white54,
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_3),
        FearIndexChart(fearList: controller.fearList)
      ],
    );
  }
}
