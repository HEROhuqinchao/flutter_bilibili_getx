import 'package:get/get.dart';

import 'live_play_logic.dart';

class LivePlayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LivePlayLogic());
  }
}
