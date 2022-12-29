import 'package:get/get.dart';

import 'canvas_paint_study_logic.dart';

class CanvasPaintStudyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CanvasPaintStudyLogic());
  }
}
