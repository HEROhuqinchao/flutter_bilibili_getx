import 'dart:typed_data';
import 'dart:ui';

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
    drawDRRect(canvas);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;

  void drawDRRect(Canvas canvas) {
    _paint
      ..color = Colors.blue
      ..strokeWidth = 1.5;
    Rect outRect =
        Rect.fromCenter(center: Offset(0, 0), width: 160, height: 160);
    Rect inRect =
        Rect.fromCenter(center: Offset(0, 0), width: 100, height: 100);
    canvas.drawDRRect(RRect.fromRectXY(outRect, 20, 20),
        RRect.fromRectXY(inRect, 20, 20), _paint);

    Rect outRect2 =
        Rect.fromCenter(center: Offset(0, 0), width: 60, height: 60);
    Rect inRect2 = Rect.fromCenter(center: Offset.zero, width: 40, height: 40);
    canvas.drawDRRect(RRect.fromRectXY(outRect2, 15, 15),
        RRect.fromRectXY(inRect2, 10, 10), _paint..color = Colors.green);
  }

  void _drawFill(Canvas canvas) {
    canvas.save();
    canvas.translate(-200, 0);
    canvas.drawCircle(Offset.zero, 60, _paint);
  }
}
