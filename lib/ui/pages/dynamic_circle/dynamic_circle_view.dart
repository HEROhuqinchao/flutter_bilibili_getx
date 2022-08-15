import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dynamic_circle_logic.dart';

class DynamicCircleScreen extends StatelessWidget {
  static const String routeName = "/dynamicCircle";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DynamicCircleLogic>();
    final state = Get.find<DynamicCircleLogic>().state;

    return Container();
  }
}
