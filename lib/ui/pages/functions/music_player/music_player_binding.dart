import 'package:get/get.dart';

import 'music_player_logic.dart';

class MusicPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MusicPlayerLogic());
  }
}
