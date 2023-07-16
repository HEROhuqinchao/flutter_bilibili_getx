import 'dart:math';
import 'dart:typed_data';
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
  Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    // canvas.drawColor(Colors.red, BlendMode.lighten);
    drawPaint(canvas, size);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;

  drawPaint(Canvas canvas, Size size) {
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
    _paint.shader = ui.Gradient.linear(Offset.zero, Offset(size.width, 0), colors, pos, TileMode.clamp);
    _paint.blendMode = BlendMode.lighten;
    canvas.drawPaint(_paint);
  }
}
