import 'package:get/get.dart';

import 'blue_tooth_device_operation_logic.dart';

class BlueToothDeviceOperationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlueToothDeviceOperationLogic());
  }
}
