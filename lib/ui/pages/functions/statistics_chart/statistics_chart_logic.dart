import 'dart:io';

import 'package:bilibili_getx/core/service/request/statistics_chart.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating/floating/assist/floating_slide_type.dart';
import 'package:flutter_floating/floating/floating.dart';
import 'package:flutter_floating/floating_increment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'statistics_chart_state.dart';

class StatisticsChartLogic extends GetxController {
  final StatisticsChartState state = StatisticsChartState();

  @override
  void onReady() {
    fetchChartData();
    initWindowsSize();
    super.onReady();
  }

  @override
  void onClose() {
    state.floatingOne.close();
    super.onClose();
  }

  void initWindowsSize() async{
    if(!kIsWeb) {
      if(Platform.isWindows) {
        await DesktopWindow.setWindowSize(Size(1000, 1000));
        await DesktopWindow.setMinWindowSize(Size(1000, 1000));
        await DesktopWindow.setMaxWindowSize(Size(1000, 1000));
      }
    }
  }

  ///获取疫情数据
  void fetchChartData() {
    HYStatisticChartRequest.fetchCovidProvinceData().then((value) {
      state.covidData = value!;
      update();
    });
  }

  void createFloatingView(context) {
    state.floatingOne = state.floatingManager.createFloating(
      "1",///key
      Floating(const FloatingIncrement(),
          slideType: FloatingSlideType.onLeftAndTop,
          isShowLog: false,
          slideBottomHeight: 100));
    state.floatingManager.createFloating("1", state.floatingOne);
    state.floatingOne.open(context);
  }
}
