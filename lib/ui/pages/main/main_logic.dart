import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../core/permission/bilibili_permission.dart';
import 'main_state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();

  @override
  void onInit() {
    ///手机端获取权限
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        BilibiliPermission.requestAllPermissions();
      }
    }
    super.onInit();
  }

  ///更新当前下标
  void updateCurrentIndex(index) {
    state.currentIndex = index;
    update();
  }
}
