import 'package:bilibili_getx/core/system/system_preferred_orientations/system_preferred_orientations_util.dart';
import 'package:get/get.dart';

import '../../../core/system/system_ui_overlay_style/system_ui_overlay_style_util.dart';
import 'main_state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();

  @override
  void onInit() {
    ///手机端获取权限
    // if (!kIsWeb) {
    //   if (Platform.isAndroid) {
    //     BilibiliPermission.requestAllPermissions();
    //   }
    // }
    SystemPreferredOrientationsUtil.setVertical();
    SystemUiOverlayStyleUtil.setWhiteSystemUiOverlayStyle();
    super.onInit();
  }

  ///更新当前下标
  void updateCurrentIndex(index) {
    state.currentIndex = index;
    update();
  }
}
