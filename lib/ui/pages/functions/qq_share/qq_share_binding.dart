import 'package:get/get.dart';

import 'qq_share_logic.dart';

class QqShareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QqShareLogic());
  }
}
