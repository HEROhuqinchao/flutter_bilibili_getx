import 'package:get/get.dart';

import 'chart_logic.dart';

class ChartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChartLogic());
  }
}
