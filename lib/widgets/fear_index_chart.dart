import 'package:coinite/data/vo/fear_vo.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FearIndexChart extends StatelessWidget {
  final List<FearVO> fearList;

  FearIndexChart({required this.fearList});

  final List<Color> gradientColors = [
    Colors.cyan,
    Colors.blue,
  ];
  Widget getDateAndMonth(String timestamp) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
    String formattedDate = DateFormat('dd-MMM').format(dateTime);
    return Text(
      formattedDate,
      style: TextStyle(
        fontSize: 10,
        color: Colors.white60,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.6,
          child: Padding(
            padding: EdgeInsets.symmetric(),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = getDateAndMonth(fearList[29].timestamp);
        break;
      case 1:
        text = getDateAndMonth(fearList[28].timestamp);
        break;
      case 2:
        text = getDateAndMonth(fearList[27].timestamp);
        break;
      case 3:
        text = getDateAndMonth(fearList[26].timestamp);
        break;
      case 4:
        text = getDateAndMonth(fearList[25].timestamp);
        break;
      case 5:
        text = getDateAndMonth(fearList[24].timestamp);
        break;
      case 6:
        text = getDateAndMonth(fearList[23].timestamp);
        break;
      case 7:
        text = getDateAndMonth(fearList[22].timestamp);
        break;
      case 8:
        text = getDateAndMonth(fearList[21].timestamp);
        break;
      case 9:
        text = getDateAndMonth(fearList[20].timestamp);
        break;
      case 10:
        text = getDateAndMonth(fearList[19].timestamp);
        break;
      case 11:
        text = getDateAndMonth(fearList[18].timestamp);
        break;
      case 12:
        text = getDateAndMonth(fearList[17].timestamp);
        break;
      case 13:
        text = getDateAndMonth(fearList[16].timestamp);
        break;
      case 14:
        text = getDateAndMonth(fearList[15].timestamp);
        break;
      case 15:
        text = getDateAndMonth(fearList[14].timestamp);
        break;
      case 16:
        text = getDateAndMonth(fearList[13].timestamp);
        break;
      case 17:
        text = getDateAndMonth(fearList[12].timestamp);
        break;
      case 18:
        text = getDateAndMonth(fearList[11].timestamp);
        break;
      case 19:
        text = getDateAndMonth(fearList[10].timestamp);
        break;
      case 20:
        text = getDateAndMonth(fearList[9].timestamp);
        break;
      case 21:
        text = getDateAndMonth(fearList[8].timestamp);
        break;
      case 22:
        text = getDateAndMonth(fearList[7].timestamp);
        break;
      case 23:
        text = getDateAndMonth(fearList[6].timestamp);
        break;
      case 24:
        text = getDateAndMonth(fearList[5].timestamp);
        break;
      case 25:
        text = getDateAndMonth(fearList[4].timestamp);
        break;
      case 26:
        text = getDateAndMonth(fearList[3].timestamp);
        break;
      case 27:
        text = getDateAndMonth(fearList[2].timestamp);
        break;
      case 28:
        text = getDateAndMonth(fearList[1].timestamp);
        break;
      case 29:
        text = getDateAndMonth(fearList[0].timestamp);
        break;
      default:
        text = Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: RotatedBox(
        quarterTurns: 3,
        child: text,
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 14,
      color: Colors.white60,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10';
        break;
      case 2:
        text = '20';
        break;
      case 3:
        text = '30';
        break;
      case 4:
        text = '40';
        break;
      case 5:
        text = '50';
        break;
      case 6:
        text = '60';
        break;
      case 7:
        text = '70';
        break;
      case 8:
        text = '80';
        break;
      case 9:
        text = '90';
        break;
      case 10:
        text = '100';
        break;
      default:
        return Container();
    }
    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.white38,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.white38,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 55,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 30,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 30,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: fearList.reversed.toList().asMap().entries.map((entry) {
            int index = entry.key;
            FearVO fearVO = entry.value;

            double x = double.parse(index.toString()); // Set your x value
            double y = double.parse(fearVO.value) / 10; // Set your y value
            return FlSpot(x, y);
          }).toList(),
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
        ),
      ],
    );
  }
}
