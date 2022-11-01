import 'package:get/get.dart';

import 'statistics_chart_logic.dart';

class StatisticsChartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StatisticsChartLogic());
  }
}
