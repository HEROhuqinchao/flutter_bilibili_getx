import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mall_logic.dart';

class MallScreen extends StatelessWidget {
  static const String routeName = "/mall";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MallLogic>();
    final state = Get.find<MallLogic>().state;

    return Container();
  }
}
