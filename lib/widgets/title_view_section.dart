import 'package:coinite/resources/dimens.dart';
import 'package:flutter/material.dart';

class TitleAndViewSection extends StatelessWidget {
  final String title;
  final String value;
  final bool isChange;
  final bool isSign;
  TitleAndViewSection({
    required this.title,
    required this.value,
    this.isChange = false,
    this.isSign = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MARGIN_MEDIUM_3),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade500),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: isChange
                ? fixAndColor(value)
                : Text(
                    isSign ? "\$ $value" : value,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget fixAndColor(String temp) {
    int? intValue = int.tryParse(temp);
    if (intValue != null) {
      int value = int.parse(temp);
      if (value >= 1000000000) {
        double result = value / 1000000000;
        return Text(
          "\$ ${result.toStringAsFixed(1)} B",
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.bold,
          ),
        );
      } else if (value >= 1000000) {
        double result = value / 1000000;
        return Text(
          "\$ ${result.toStringAsFixed(1)} M",
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.bold,
          ),
        );
      } else {
        return Container();
      }
    } else {
      double value = double.parse(temp);
      if (value < 0) {
        return Text(
          "${value.toStringAsFixed(3)} %",
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        );
      } else if (value < 10) {
        return Text(
          " ${value.toStringAsFixed(3)} %",
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        );
      } else {
        return Text(
          " ${value.toStringAsFixed(2)} %",
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        );
      }
    }
  }
}
