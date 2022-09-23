import 'package:get/get.dart';

import 'ready2_publish_logic.dart';

class Ready2PublishBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Ready2PublishLogic());
  }
}
