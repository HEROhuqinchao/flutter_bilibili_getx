import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

//渐变色文字静态效果
Paint getPaint001() {
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
//文字外框模糊效果
Paint getPaint002() {
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
  paint.maskFilter = MaskFilter.blur(BlurStyle.solid, 3); //模糊
  return paint;
}
main() {
  runApp(MaterialApp(
    home: PartOne(),
  ));
}

class PartOne extends StatelessWidget {
  const PartOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "你好",
          style: TextStyle(
            fontSize: 60,
            // foreground: getPaint001(),
            foreground: getPaint002(),
          ),
        ),
      ),
    );
  }
}
