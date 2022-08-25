import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'live_logic.dart';

class LiveScreen extends StatelessWidget {
  static const String routeName = "/home/live";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<LiveLogic>();
    final state = Get.find<LiveLogic>().state;

    return Container();
  }
}
