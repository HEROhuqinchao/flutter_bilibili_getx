import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'animation_study_logic.dart';

///https://juejin.cn/book/6965102582473687071/section/6964982031298068510?utm_source=post_pay_page
///动画器Animation
class AnimationStudyView extends StatelessWidget {
  static String routeName = "/animation_study";
  final List<Color> colors = [
    Color(0xFFF60C0C),
    Color(0xFFF3B913),
    Color(0xFFE7F716),
    Color(0xFF3DF30B),
    Color(0xFF0DF6EF),
    Color(0xFF0829FB),
    Color(0xFFB709F4),
  ];
  final List<double> pos = [
    1.0 / 7,
    2.0 / 7,
    3.0 / 7,
    4.0 / 7,
    5.0 / 7,
    6.0 / 7,
    1.0
  ];

  Paint getPaint() {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint.shader = ui.Gradient.linear(
      Offset(0, 0),
      Offset(100, 0),
      colors,
      pos,
      TileMode.mirror,
      Matrix4.rotationZ(pi / 6).storage,
    );
    return paint;
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<AnimationStudyLogic>();
    final state = Get.find<AnimationStudyLogic>().state;

    return Center(
      child: Text(
        "你好",
        style: TextStyle(
          fontSize: 60,
          foreground: getPaint(),
        ),
      ),
    );
  }
}
