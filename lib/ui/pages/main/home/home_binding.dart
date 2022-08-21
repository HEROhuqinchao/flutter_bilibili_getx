import 'package:get/get.dart';

import 'home_logic.dart';
import 'login/login_logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => LoginLogic());
  }
}
