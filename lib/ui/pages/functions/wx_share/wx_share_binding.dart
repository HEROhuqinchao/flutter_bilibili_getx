import 'package:get/get.dart';

import 'wx_share_logic.dart';

class WxShareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WxShareLogic());
  }
}
