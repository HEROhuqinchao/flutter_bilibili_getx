import 'package:get/get.dart';

import 'blue_tooth_connection_logic.dart';

class BlueToothConnectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlueToothConnectionLogic());
  }
}
