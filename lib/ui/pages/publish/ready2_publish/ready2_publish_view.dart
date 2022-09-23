import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ready2_publish_logic.dart';

class Ready2PublishView extends StatelessWidget {
  static String routeName = "/ready_2_publish";
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<Ready2PublishLogic>();
    final state = Get.find<Ready2PublishLogic>().state;

    return Container();
  }
}
