import 'package:get/get.dart';

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
}
