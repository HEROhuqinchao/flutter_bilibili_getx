import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'main_state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();
  ///权限获取
  void requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.phone,
      Permission.storage,
      Permission.location,
      Permission.notification,
    ].request();
  }
  ///更新当前下标
  void updateCurrentIndex(index) {
    state.currentIndex = index;
    ///调用update()来提醒GetBuilder更新界面
    update();
  }
}
