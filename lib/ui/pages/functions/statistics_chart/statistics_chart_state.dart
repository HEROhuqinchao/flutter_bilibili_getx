import 'package:flutter_floating/floating/floating.dart';
import 'package:flutter_floating/floating/manager/floating_manager.dart';

import '../../../../core/model/covid_province_model.dart';

class StatisticsChartState {
  ///浮动窗口
  late FloatingManager floatingManager;
  late Floating floatingOne;
  late List<Datum> covidData = [];
  StatisticsChartState() {
    floatingManager = FloatingManager();
    covidData = [];
  }
}
