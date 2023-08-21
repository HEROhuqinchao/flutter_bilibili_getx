import 'dart:ui';

import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/mix/grid.dart';
import 'package:flutter/material.dart';

class Paper extends StatelessWidget {
  const Paper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.white,
      child: CustomPaint(
        painter: PaperCustomPainter(),
      ),
    );
  }
}

class PaperCustomPainter extends CustomPainter with Grid {
  static const double step = 20;
  final List<Color> colors = List<Color>.generate(
      256, (index) => Color.fromARGB(255 - index, 255, 0, 0));

  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    Paint paint = Paint();
    canvas.translate(-step * 8.0, -step * 8.0);
    colors.asMap().forEach((key, value) {
      int line = key % 16;
      int row = key ~/ 16;
      var topLeft = Offset(step * line, step * row);
      var rect = Rect.fromPoints(topLeft, topLeft.translate(step, step));
      canvas.drawRect(rect, paint..color = value);
    });
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;
}
