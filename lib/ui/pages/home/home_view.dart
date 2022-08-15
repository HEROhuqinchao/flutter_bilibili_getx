import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HomeLogic>();
    final state = Get.find<HomeLogic>().state;

    return Container();
  }
}
