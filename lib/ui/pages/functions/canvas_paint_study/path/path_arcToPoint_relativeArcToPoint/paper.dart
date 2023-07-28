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
  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.deepPurpleAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    path.lineTo(80, -40);
    path
      ..arcToPoint(
        const Offset(40, 40),
        radius: const Radius.circular(60),
        largeArc: false,
      )
      ..close();
    canvas.drawPath(path, paint);

    path.reset();
    canvas.translate(-150, 0);
    path.lineTo(80, -40);
    path
      ..arcToPoint(
        const Offset(80, -40),
        radius: const Radius.circular(60),
        largeArc: true,
        clockwise: false,
      )
      ..close();
    canvas.drawPath(path, paint);

    path.reset();
    canvas.translate(150 + 150, 0);

    path.lineTo(80, -40);
    path
      ..arcToPoint(const Offset(40, 40), radius: const Radius.circular(60), largeArc: true)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;
}
