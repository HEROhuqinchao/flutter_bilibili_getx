import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;

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
  final Paint _paint = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.red.withOpacity(.8);

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCenter(center: Offset.zero, width: 1000, height: 1000);
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    Path path = Path();
    path.lineTo(80, 80);
    path.lineTo(-80, 80);
    path.close();
    canvas.clipPath(path);
    canvas.drawRect(rect, _paint);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;
}
