import 'package:get/get.dart';

import 'mall_logic.dart';

class MallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MallLogic());
  }
}
