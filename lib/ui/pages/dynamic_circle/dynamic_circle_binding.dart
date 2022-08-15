import 'package:get/get.dart';

import 'dynamic_circle_logic.dart';

class DynamicCircleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DynamicCircleLogic());
  }
}
