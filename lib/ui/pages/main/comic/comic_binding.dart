import 'package:get/get.dart';

import 'comic_logic.dart';

class ComicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComicLogic());
  }
}
