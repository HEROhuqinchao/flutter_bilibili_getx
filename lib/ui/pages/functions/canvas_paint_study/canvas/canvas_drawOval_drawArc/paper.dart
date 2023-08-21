import 'dart:math';

import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/mix/grid.dart';
import 'package:flutter/material.dart';

class Paper extends StatelessWidget {
  const Paper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: PaperCustomPainter(),
      ),
    );
  }
}

class PaperCustomPainter extends CustomPainter with Grid {
  Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    drawFill(canvas);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;

  void drawFill(Canvas canvas) {
    canvas.save();
    canvas.translate(-200, 0);
    canvas.drawCircle(Offset.zero, 60, _paint);
    canvas.restore();
    var rect = Rect.fromCenter(center: Offset.zero, width: 100, height: 120);
    canvas.drawOval(rect, _paint);
    canvas.save();
    canvas.translate(200, 0);
    canvas.drawArc(rect, 0, pi / 2 * 3, true, _paint);
    canvas.restore();
  }
}
