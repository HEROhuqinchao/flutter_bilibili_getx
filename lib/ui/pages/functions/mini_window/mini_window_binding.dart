import 'package:get/get.dart';

import 'mini_window_logic.dart';

class MiniWindowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MiniWindowLogic());
  }
}
