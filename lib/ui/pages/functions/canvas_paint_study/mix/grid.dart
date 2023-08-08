import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

mixin Grid {
  late double _step = 20;
  final double _strokeWidth = .5;
  final Color _color = Colors.grey;
  late Paint _axisPaint;
  final TextPainter _textPainter =
      TextPainter(textDirection: TextDirection.ltr);
  late final Paint _gridPaint = Paint()
    ..strokeWidth = _strokeWidth
    ..style = PaintingStyle.stroke
    ..color = _color;

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
      canvas.drawLine(
          const Offset(0, 0), Offset(0, size.height / 2), gridPaint);
      canvas.translate(_step, 0);
    }
    canvas.restore();
  }

  void drawGrid(Canvas canvas, Size size, {double? step}) {
    _step = step ?? 20;
    canvas.translate(size.width / 2, size.height / 2);
    drawGridWithPath(canvas, size);
    // _drawBottomRight(canvas, size);
    canvas.save();
    canvas.scale(1, -1);
    drawGridWithPath(canvas, size);
    // _drawBottomRight(canvas, size);
    canvas.restore();
    canvas.save();
    canvas.scale(-1, 1);
    drawGridWithPath(canvas, size);
    // _drawBottomRight(canvas, size);
    canvas.restore();
    canvas.save();
    canvas.scale(-1, -1);
    drawGridWithPath(canvas, size);
    // _drawBottomRight(canvas, size);
    canvas.restore();
  }

  void drawColorfulGrid(Canvas canvas, Size size) {
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
    _gridPaint.shader = ui.Gradient.sweep(
        Offset.zero, colors, pos, TileMode.mirror, pi / 2, pi);
    canvas.translate(size.width / 2, size.height / 2);
    drawGridWithPath(canvas, size);
    // _drawBottomRight(canvas, size);
    canvas.save();
    canvas.scale(1, -1);
    drawGridWithPath(canvas, size);
    // _drawBottomRight(canvas, size);
    canvas.restore();
    canvas.save();
    canvas.scale(-1, 1);
    drawGridWithPath(canvas, size);
    // _drawBottomRight(canvas, size);
    canvas.restore();
    canvas.save();
    canvas.scale(-1, -1);
    drawGridWithPath(canvas, size);
    // _drawBottomRight(canvas, size);
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
    canvas.drawLine(Offset(-7, size.height / 2 - 7), Offset(0, size.height / 2),
        _axisPaint);
    canvas.drawLine(
        Offset(7, size.height / 2 - 7), Offset(0, size.height / 2), _axisPaint);
    _drawText(canvas, size);
  }

  void drawGridWithPath(Canvas canvas, Size size) {
    Path gridPath = Path();
    for (int i = 0; i < size.width / 2 / _step; i++) {
      gridPath.moveTo(_step * i, -size.height / 2);
      gridPath.relativeLineTo(0, size.height);
      gridPath.moveTo(-_step * i, -size.height / 2);
      gridPath.relativeLineTo(0, size.height);
    }
    for (int i = 0; i < size.height / 2 / _step; i++) {
      gridPath.moveTo(-size.width / 2, _step * i);
      gridPath.relativeLineTo(size.width, 0);
      gridPath.moveTo(-size.width / 2, -_step * i);
      gridPath.relativeLineTo(size.width, 0);
    }
    canvas.drawPath(gridPath, _gridPaint);
  }

  void _drawText(Canvas canvas, Size size) {
    canvas.save();
    for (int i = 0; i < size.height / 2 / _step; i++) {
      if (_step < 30 && i.isOdd || i == 0) {
        canvas.translate(0, _step);
        continue;
      } else {
        var str = (i * _step).toInt().toString();
        _drawAxisText(canvas, str, color: Colors.green);
      }
      canvas.translate(0, _step);
    }
    canvas.restore();

    canvas.save();
    for (int i = 0; i < size.width / 2 / _step; i++) {
      if (i == 0) {
        _drawAxisText(canvas, "0", color: Colors.black, x: null);
        canvas.translate(_step, 0);
        continue;
      }
      if (_step < 30 && i.isOdd) {
        canvas.translate(_step, 0);
        continue;
      } else {
        var str = (i * _step).toInt().toString();
        _drawAxisText(canvas, str, color: Colors.green, x: true);
      }
      canvas.translate(_step, 0);
    }
    canvas.restore();

    canvas.save();
    for (int i = 0; i < size.height / 2 / _step; i++) {
      if (_step < 30 && i.isOdd || i == 0) {
        canvas.translate(0, -_step);
        continue;
      } else {
        var str = (-i * _step).toInt().toString();
        _drawAxisText(canvas, str, color: Colors.green);
        canvas.translate(0, -_step);
      }
    }
    canvas.restore();

    canvas.save();
    for (int i = 0; i < size.width / 2 / _step; i++) {
      if (_step < 30 && i.isOdd || i == 0) {
        canvas.translate(-_step, 0);
        continue;
      } else {
        var str = (-i * _step).toInt().toString();
        _drawAxisText(canvas, str, color: Colors.green, x: true);
      }
      canvas.translate(-_step, 0);
    }
    canvas.restore();
  }

  void _drawAxisText(
    Canvas canvas,
    String str, {
    Color color = Colors.black,
    bool? x = false,
  }) {
    TextSpan text =
        TextSpan(text: str, style: TextStyle(fontSize: 11, color: color));
    _textPainter.text = text;
    _textPainter.layout();

    Size size = _textPainter.size;
    Offset offset = const Offset(0, 0);
    if (x == null) {
      offset = const Offset(8, 8);
    } else if (x) {
      offset = Offset(-size.width / 2, size.height / 2);
    } else {
      offset = Offset(size.height / 2, -size.height / 2 + 2);
    }
    _textPainter.paint(canvas, offset);
  }
}
