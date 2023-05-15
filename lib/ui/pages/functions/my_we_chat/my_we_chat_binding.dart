import 'package:get/get.dart';

import 'my_we_chat_logic.dart';

class MyWeChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyWeChatLogic());
  }
}
