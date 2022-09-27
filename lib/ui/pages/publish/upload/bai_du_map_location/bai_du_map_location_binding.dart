import 'package:get/get.dart';

import 'bai_du_map_location_logic.dart';

class BaiDuMapLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaiDuMapLocationLogic());
  }
}
