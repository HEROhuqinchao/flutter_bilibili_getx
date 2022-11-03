import 'package:bilibili_getx/core/extension/color_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'statistics_chart_logic.dart';

class StatisticsChartView extends StatelessWidget {
  static String routeName = "/chart";
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final logic = Get.find<StatisticsChartLogic>();
  final state = Get.find<StatisticsChartLogic>().state;
  int touchedIndex = -1;
  List<Color> gradientColors = [
    const Color(0xff56cacb),
    const Color(0xff02233b),
  ];

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<StatisticsChartLogic>();
    final state = Get.find<StatisticsChartLogic>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text("图表"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AspectRatio(
            aspectRatio: 1.70,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Color(0xff232d37),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 18,
                  left: 12,
                  top: 24,
                  bottom: 12,
                ),
                child: LineChart(
                  tempData(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  LineChartData tempData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: true),
      gridData: FlGridData(
        show: true,
      ),
      titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          )),
          leftTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 42,
                  interval: 5,
                  getTitlesWidget: leftTitleWidgets)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: false,
          ))),
      borderData: FlBorderData(
          show: true, border: Border.all(color: Color(0xff37434d))),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3.67),
            FlSpot(1, 5.44),
            FlSpot(2, 4.44),
            FlSpot(3, 8.54),
            FlSpot(4, 7.87),
            FlSpot(5, 4.23),
            FlSpot(6, 4.98),
            FlSpot(7, 6.21),
            FlSpot(8, 5.67),
            FlSpot(9, 7.44),
            FlSpot(10, 6.44),
            FlSpot(11, 8.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              gradientColors[0],
              gradientColors[0],
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                gradientColors[0].withOpacity(.5),
                gradientColors[1].withOpacity(.5),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        LineChartBarData(
          spots: [
            FlSpot(0, 2.44),
            FlSpot(1, 5.32),
            FlSpot(2, 6.54),
            FlSpot(3, 4.73),
            FlSpot(4, 7.85),
            FlSpot(5, 4.24),
            FlSpot(6, 6.65),
            FlSpot(7, 2.15),
            FlSpot(8, 8.74),
            FlSpot(9, 5.08),
            FlSpot(10, 7.04),
            FlSpot(11, 6.23),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              gradientColors[1],
              gradientColors[1],
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                gradientColors[0].withOpacity(.3),
                gradientColors[1].withOpacity(.3),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        )
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('0', style: style);
        break;
      case 1:
        text = const Text('1', style: style);
        break;
      case 2:
        text = const Text('2', style: style);
        break;
      case 3:
        text = const Text('3', style: style);
        break;
      case 4:
        text = const Text('4', style: style);
        break;
      case 5:
        text = const Text('5', style: style);
        break;
      case 6:
        text = const Text('6', style: style);
        break;
      case 7:
        text = const Text('7', style: style);
        break;
      case 8:
        text = const Text('8', style: style);
        break;
      case 9:
        text = const Text('9', style: style);
        break;
      case 10:
        text = const Text('10', style: style);
        break;
      case 11:
        text = const Text('11', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('0', style: style);
        break;
      case 5:
        text = const Text('5K', style: style);
        break;
      case 10:
        text = const Text('1W', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
}
