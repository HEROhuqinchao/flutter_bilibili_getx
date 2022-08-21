import 'package:get/get.dart';

import 'scan_login_logic.dart';

class ScanLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanLoginLogic());
  }
}
