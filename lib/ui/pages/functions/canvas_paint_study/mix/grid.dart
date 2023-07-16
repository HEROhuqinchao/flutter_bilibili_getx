import 'dart:ui';

import 'package:flutter/material.dart';

mixin Grid {
  late Paint _gridPaint;
  final double step = 20;
  final double strokeWidth = .5;
  final Color color = Colors.grey;
  late Paint _dotPaint;
  late Paint _axisPaint;

  void _drawBottomRight(Canvas canvas, Size size) {
    Paint _gridPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color;
    canvas.save();
    for (int i = 0; i < size.height / 2 / step; i++) {
      canvas.drawLine(Offset(0, 0), Offset(size.width / 2, 0), _gridPaint);
      canvas.translate(0, step);
    }
    canvas.restore();
    canvas.save();
    for (int i = 0; i < size.width / 2 / step; i++) {
      canvas.drawLine(Offset(0, 0), Offset(0, size.height / 2), _gridPaint);
      canvas.translate(step, 0);
    }
    canvas.restore();
  }

  void drawGrid(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    _drawBottomRight(canvas, size);
    canvas.save();
    canvas.scale(1, -1);
    _drawBottomRight(canvas, size);
    canvas.restore();
    canvas.save();
    canvas.scale(-1, 1);
    _drawBottomRight(canvas, size);
    canvas.restore();
    canvas.save();
    canvas.scale(-1, -1);
    _drawBottomRight(canvas, size);
    canvas.restore();
  }

  void drawAxis(Canvas canvas, Size size) {
    _axisPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 1.5;
    canvas.drawLine(
        Offset(-size.width / 2, 0), Offset(size.width / 2, 0), _axisPaint);
    canvas.drawLine(
        Offset(0, size.height / 2), Offset(0, -size.height / 2), _axisPaint);
    canvas.drawLine(
        Offset(size.width / 2 - 7, -7), Offset(size.width / 2, 0), _axisPaint);
    canvas.drawLine(
        Offset(size.width / 2 - 7, 7), Offset(size.width / 2, 0), _axisPaint);
    canvas.drawLine(
        Offset(-7, -size.height / 2 + 7), Offset(0, -size.height / 2), _axisPaint);
    canvas.drawLine(
        Offset(7, -size.height / 2 + 7), Offset(0, -size.height / 2), _axisPaint);
  }
}
