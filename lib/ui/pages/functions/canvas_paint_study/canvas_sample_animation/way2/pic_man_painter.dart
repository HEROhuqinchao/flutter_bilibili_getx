import 'dart:math';

import 'package:flutter/material.dart';

class PicManPainter extends CustomPainter {
  final Paint _paint = Paint();
  final AnimationController controller;
  final ColorTween colorTween = ColorTween(begin: Colors.blue, end: Colors.red);
  final Tween<double> angleTween = Tween(begin: 5.0, end: 30.0);

  PicManPainter({
    required this.controller,
  }) : super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);
    final double radius = size.width / 2;
    canvas.translate(radius, size.height / 2);
    _drawHead(canvas, size);
    _drawEye(canvas, radius);
  }

  @override
  bool shouldRepaint(covariant PicManPainter oldDelegate) {
    return oldDelegate.controller != controller;
  }

  void _drawHead(Canvas canvas, Size size) {
    var rect = Rect.fromCenter(
      center: Offset.zero,
      width: size.width,
      height: size.height,
    );
    var a = angleTween.evaluate(controller) / 180 * pi;
    canvas.drawArc(
      rect,
      a,
      2 * pi - a.abs() * 2,
      true,
      _paint..color = colorTween.evaluate(controller) ?? Colors.black,
    );
  }

  void _drawEye(Canvas canvas, double radius) {
    canvas.drawCircle(
      Offset(radius * .15, -radius * .6),
      radius * .12,
      _paint..color = Colors.white,
    );
  }
}
