import 'dart:ui';

import 'package:flutter/material.dart';

mixin Grid {
  late Paint _gridPaint;
  final double _step = 20;
  final double _strokeWidth = .5;
  final Color _color = Colors.grey;
  late Paint _dotPaint;
  late Paint _axisPaint;

  void _drawBottomRight(Canvas canvas, Size size) {
    Paint gridPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth
      ..color = _color;
    canvas.save();
    for (int i = 0; i < size.height / 2 / _step; i++) {
      canvas.drawLine(const Offset(0, 0), Offset(size.width / 2, 0), gridPaint);
      canvas.translate(0, _step);
    }
    canvas.restore();
    canvas.save();
    for (int i = 0; i < size.width / 2 / _step; i++) {
      canvas.drawLine(const Offset(0, 0), Offset(0, size.height / 2), gridPaint);
      canvas.translate(_step, 0);
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
