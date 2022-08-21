import 'package:get/get.dart';

import 'live_logic.dart';

class LiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LiveLogic());
  }
}
