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
    Paint paint = Paint()..style = PaintingStyle.stroke;
    Path path = Path()
      // ..moveTo(size.width / 2, size.height / 2)
      ..relativeLineTo(40, 40)
      ..relativeLineTo(0, -40)
      ..close();
    Matrix4 m4 = Matrix4.translationValues(0, 0, 0);
    Matrix4 rotateM4 = Matrix4.rotationZ(10 * pi / 180);
    Matrix4 scaleM4 = Matrix4.diagonal3Values(2, 2, 1);
    Matrix4 back = Matrix4.translationValues(-20, -20, 0);
    m4.multiply(rotateM4);
    m4.multiply(scaleM4);
    m4.multiply(back);
    path = path.transform(m4.storage);
    canvas.drawPath(path, paint);
    print(path.contains(Offset(30, 10)));
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;
}
