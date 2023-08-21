import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurveBoxPainter extends CustomPainter {
  final Animation<double> repaint;
  Animation<double> angleAnimation;
  Paint _paint = Paint();

  CurveBoxPainter({
    required this.repaint,
    required this.angleAnimation,
  }) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);
    canvas.translate(size.width / 2, size.height / 2);
    _drawRing(canvas, size);
    _drawRedBall(canvas, size);
    _drawGreenBall(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CurveBoxPainter oldDelegate) {
    return oldDelegate.repaint != repaint;
  }

  void _drawRing(Canvas canvas, Size size) {
    const double strokeWidth = 5;
    canvas.drawCircle(
      Offset.zero,
      size.width / 2 - strokeWidth,
      _paint
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..color = Colors.blue,
    );
  }

  void _drawRedBall(Canvas canvas, Size size) {
    canvas.save();
    canvas.rotate(angleAnimation.value * 2 * pi);
    canvas.drawCircle(
      Offset(0, -(size.width / 2) + 5),
      5,
      _paint
        ..color = Colors.red
        ..style = PaintingStyle.fill,
    );
    canvas.restore();
  }

  void _drawGreenBall(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(0, angleAnimation.value * (size.height - 10));
    canvas.drawCircle(
      Offset(0, -(size.width / 2) + 5),
      5,
      _paint
        ..color = Colors.green
        ..style = PaintingStyle.fill,
    );
    canvas.restore();
  }
}
