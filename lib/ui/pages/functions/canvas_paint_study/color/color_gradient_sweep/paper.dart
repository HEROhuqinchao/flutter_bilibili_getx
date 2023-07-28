import 'dart:math';
import 'dart:ui' as ui;

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
  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    drawShadowSweep(canvas);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;

  void drawShadowSweep(ui.Canvas canvas) {
    var colors = [
      Color(0xFFF60C0C),
      Color(0xFFF3B913),
      Color(0xFFE7F716),
      Color(0xFF3DF30B),
      Color(0xFF0DF6EF),
      Color(0xFF0829FB),
      Color(0xFFB709F4),
    ];
    var pos = [1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];
    Paint paint = Paint();
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.blue;
    paint.shader =
        ui.Gradient.sweep(Offset.zero, colors, pos, TileMode.clamp, pi / 2, pi);
    canvas.drawCircle(Offset.zero, 50, paint);

    canvas.translate(160, 0);
    paint.shader =
        ui.Gradient.sweep(Offset.zero, colors, pos, TileMode.repeated, pi / 2, pi);
    canvas.drawCircle(Offset.zero, 50, paint);

    canvas.translate(-160 * 2, 0);
    paint.shader =
        ui.Gradient.sweep(Offset.zero, colors, pos, TileMode.repeated, pi / 2, pi);
    canvas.drawCircle(Offset.zero, 50, paint);
  }
}
