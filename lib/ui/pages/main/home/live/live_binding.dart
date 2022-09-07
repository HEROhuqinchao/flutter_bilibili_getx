import 'package:bilibili_getx/ui/pages/main/home/home_logic.dart';
import 'package:get/get.dart';

import 'live_logic.dart';

class LiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LiveLogic());
    Get.lazyPut(() => HomeLogic());
  }
}
