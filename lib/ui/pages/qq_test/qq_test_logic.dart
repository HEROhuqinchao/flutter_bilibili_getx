import 'package:bilibili_getx/core/qq_util/qq_util.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'qq_test_state.dart';

class QqTestLogic extends GetxController {
  final QqTestState state = QqTestState();

  @override
  void onReady() {
    QQUtil.checkQQInstalled().then((value) {
      if (value == true) {
        QQUtil.initPermissionGranted();
        QQUtil.registerApp();
      } else {
        SmartDialog.showToast("请先安装QQ");
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    state.streamSubscription.cancel();
    super.onClose();
  }
}
