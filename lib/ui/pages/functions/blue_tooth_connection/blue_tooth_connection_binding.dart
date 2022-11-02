import 'package:bilibili_getx/ui/pages/functions/blue_tooth_connection/blue_tooth_device_operation/blue_tooth_device_operation_logic.dart';
import 'package:get/get.dart';

import 'blue_tooth_connection_logic.dart';

class BlueToothConnectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlueToothConnectionLogic());
    Get.lazyPut(() => BlueToothDeviceOperationLogic());
  }
}
