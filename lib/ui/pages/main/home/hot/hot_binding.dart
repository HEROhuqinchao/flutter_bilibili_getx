import 'package:get/get.dart';

import 'hot_logic.dart';

class HotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HotLogic());
  }
}
