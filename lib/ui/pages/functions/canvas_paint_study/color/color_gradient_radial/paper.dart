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
    drawShaderLiner(canvas);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;

  void drawShaderLiner(Canvas canvas) {
    var colors = [
      const Color(0xFFF60C0C),
      const Color(0xFFF3B913),
      const Color(0xFFE7F716),
      const Color(0xFF3DF30B),
      const Color(0xFF0DF6EF),
      const Color(0xFF0829FB),
      const Color(0xFFB709F4),
    ];
    var pos = [1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];
    Paint paint = Paint();
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.blue;
    canvas.save();
    paint.shader =
        ui.Gradient.radial(Offset.zero, 25, colors, pos, TileMode.clamp);
    canvas.drawCircle(Offset.zero, 50, paint);
    canvas.translate(160, 0);
    paint.shader =
        ui.Gradient.radial(Offset.zero, 25, colors, pos, TileMode.repeated);
    canvas.drawCircle(Offset.zero, 50, paint);
    canvas.translate(-160 * 2, 0);
    paint.shader =
        ui.Gradient.radial(Offset.zero, 25, colors, pos, TileMode.mirror);
    canvas.drawCircle(Offset.zero, 50, paint);
    canvas.restore();
    canvas.translate(0, 120);
    paint.shader = ui.Gradient.radial(Offset.zero, 25, colors, pos,
        TileMode.repeated, null, const Offset(10, 10), 1);
    canvas.drawCircle(Offset.zero, 50, paint);
  }
}
