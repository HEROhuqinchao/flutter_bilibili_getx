import 'package:get/get.dart';

import 'push_message_logic.dart';

class PushMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PushMessageLogic());
  }
}
