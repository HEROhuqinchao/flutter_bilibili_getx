import 'package:bilibili_getx/ui/pages/login/login_logic.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => LoginLogic());
  }
}
