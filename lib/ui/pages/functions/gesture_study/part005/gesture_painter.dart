import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GesturePainter extends CustomPainter {
  Paint gridPaint = Paint()
    ..color = Colors.green
    ..style = PaintingStyle.stroke;
  Path gridPath = Path();
  ValueListenable<Matrix4> matrix;

  GesturePainter(this.matrix) : super(repaint: matrix);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    canvas.transform(matrix.value.storage);
    drawSomething(canvas, size);
  }

  @override
  bool shouldRepaint(covariant GesturePainter oldDelegate) =>
      oldDelegate.matrix != matrix;

  void drawSomething(Canvas canvas, Size size) {
    canvas.drawCircle(Offset.zero, 10, Paint());
    gridPath.reset();
    gridPath.moveTo(-size.width / 2, 0);
    gridPath.relativeLineTo(size.width, 0);
    gridPath.moveTo(0, -size.height / 2);
    gridPath.relativeLineTo(0, size.height);
    canvas.drawPath(gridPath, gridPaint);
    canvas.drawCircle(
        Offset.zero.translate(4, 4), 1, Paint()..color = Colors.white);
    canvas.drawCircle(
        Offset.zero.translate(-4, -4), 1, Paint()..color = Colors.white);
    canvas.drawCircle(
        Offset.zero.translate(4, -4), 1, Paint()..color = Colors.white);
  }
}
