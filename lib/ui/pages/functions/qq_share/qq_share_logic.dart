import 'package:get/get.dart';

import 'qq_share_state.dart';

class QqShareLogic extends GetxController {
  final QqShareState state = QqShareState();

  @override
  void onReady() {
    // QQUtil.checkQQInstalled().then((value) {
    //   if (value == true) {
    //     QQUtil.initPermissionGranted();
    //     QQUtil.registerApp();
    //   } else {
    //     SmartDialog.showToast("请先安装QQ");
    //   }
    // });
    super.onReady();
  }

  @override
  void onClose() {
    // state.streamSubscription.cancel();
    super.onClose();
  }
}
