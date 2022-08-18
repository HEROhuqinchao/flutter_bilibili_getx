import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'recommend_logic.dart';

class RecommendScreen extends StatelessWidget {
  static const String routeName = "/recommend";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<RecommendLogic>();
    final state = Get.find<RecommendLogic>().state;

    return Container();
  }
}
