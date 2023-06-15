import 'package:get/get.dart';

import 'wechat_register_logic.dart';

class WechatRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WechatRegisterLogic());
  }
}
