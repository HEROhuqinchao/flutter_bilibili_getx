import 'package:get/get.dart';

import 'search_location_logic.dart';

class SearchLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchLocationLogic());
  }
}
