import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'publish_logic.dart';

class PublishScreen extends StatelessWidget {
  static const String routeName = "/publish";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PublishLogic>();
    final state = Get.find<PublishLogic>().state;

    return Container();
  }
}
