import 'package:get/get.dart';

import 'bilibili_test_logic.dart';

class BilibiliTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BilibiliTestLogic());
  }
}
