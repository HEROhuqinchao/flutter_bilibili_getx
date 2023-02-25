import 'package:get/get.dart';

import 'scan_qr_logic.dart';

class ScanQrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanQrLogic());
  }
}
