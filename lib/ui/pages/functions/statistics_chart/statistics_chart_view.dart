import 'package:bilibili_getx/core/extension/color_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating/floating/assist/floating_slide_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/legend_widget.dart';
import 'statistics_chart_logic.dart';

class StatisticsChartView extends StatelessWidget {
  static String routeName = "/statistics_chart";
  final Color barBackgroundColor = const Color(0xff72d8bf);
  static const leftBarColor = Color(0xff632af2);
  static const middleBarColor = Color(0xffffb3ba);
  static const rightBarColor = Color(0xff578eff);
  final logic = Get.find<StatisticsChartLogic>();
  final state = Get.find<StatisticsChartLogic>().state;
  int touchedIndex = -1;
  List<Color> gradientColors = [
    const Color(0xff56cacb),
    const Color(0xff02233b),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatisticsChartLogic>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          title: Text("图表"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            logic.createFloatingView(context);
          },
          child: Text("浮动"),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.r),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 5.r,
                mainAxisSpacing: 5.r,
                childAspectRatio: 1.5),
            itemBuilder: (ctx, index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                  color: Color(0xff232d37),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 18.r,
                    left: 6.r,
                    top: 24.r,
                    bottom: 12.r,
                  ),
                  child: index == 0
                      ? chart001()
                      // : index == 1
                      //     ? chart002()
                          : Container(),
                ),
              );
            },
            itemCount: 7,
          ),
        ),
      );
    });
  }

  Widget chart003() {
    return Container();
  }

  ///图表二
  Widget chart002() {
    List<BarChartGroupData> barGroups = [];
    if (state.covidData.isNotEmpty) {
      for (int i = 0; i < 15; i++) {
        barGroups.add(makeGroupData(
          i,
          state.covidData[i].now!.sureNewHid.runtimeType == int
              ? state.covidData[i].now!.sureNewHid.toDouble()
              : 0,
          state.covidData[i].now!.sureNewLoc.runtimeType == int
              ? state.covidData[i].now!.sureNewLoc.toDouble()
              : 0,
          state.covidData[i].now!.surePresent.runtimeType == int
              ? state.covidData[i].now!.surePresent.toDouble()
              : 0,
        ));
      }
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LegendsListWidget(
          legends: [
            Legend('sureNewHid', leftBarColor),
            Legend('sureNewLoc', middleBarColor),
            Legend('surePresent', rightBarColor),
          ],
        ),
        15.verticalSpace,
        AspectRatio(
          aspectRatio: 1.7,
          child: BarChart(
            BarChartData(
              maxY: 50000,
              gridData: FlGridData(
                show: false,
              ),
              barGroups: barGroups,
              titlesData: FlTitlesData(
                show: true,
                rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: false,
                )),
                topTitles: AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: false,
                )),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    reservedSize: 40,
                    showTitles: true,
                    getTitlesWidget: bottomTitles,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: 1,
                    getTitlesWidget: leftTitles,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 100) {
      text = '100';
    } else if (value == 500) {
      text = '500';
    } else if (value == 1000) {
      text = '1K';
    } else if (value == 5000) {
      text = '5K';
    } else if (value == 10000) {
      text = '1W';
    } else if (value == 50000) {
      text = '5W';
    }else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 8.sp,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    List<String> titles = [];
    for (int i = 0; i < 5; i++) {
      titles.add(state.covidData[i].city);
    }
    final Widget text = Text(
      titles[value.toInt()],
      style: TextStyle(
        fontSize: 12.sp,
        color: Colors.white,
      ),
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double y3) {
    double width = 5.r;
    return BarChartGroupData(
      x: x,
      barsSpace: 4.r,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: middleBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y3,
          color: rightBarColor,
          width: width,
        )
      ],
    );
  }

  ///图标一
  LineChart chart001() {
    return LineChart(
      LineChartData(
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
      ),
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
