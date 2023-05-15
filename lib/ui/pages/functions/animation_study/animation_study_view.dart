import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'animation_study_logic.dart';

///动画器Animation
class AnimationStudyView extends StatelessWidget {
  static String routeName = "/animation_study";
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<AnimationStudyLogic>();
    final state = Get.find<AnimationStudyLogic>().state;

    return Container();
  }
}
