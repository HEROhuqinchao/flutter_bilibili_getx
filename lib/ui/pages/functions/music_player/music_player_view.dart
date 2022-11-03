import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'music_player_logic.dart';

class MusicPlayerView extends StatelessWidget {
  static String routeName = "/music_player";
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MusicPlayerLogic>();
    final state = Get.find<MusicPlayerLogic>().state;

    return Container();
  }
}
