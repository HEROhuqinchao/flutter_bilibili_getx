import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PicManPainter extends CustomPainter {
  final Animation<Color?> color;
  final Paint _paint = Paint();
  final Animation<double> angle;
  final AnimationController controller;

  PicManPainter({
    required this.color,
    required this.angle,
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
    return oldDelegate.color != color || oldDelegate.angle != angle;
  }

  void _drawHead(Canvas canvas, Size size) {
    var rect = Rect.fromCenter(
      center: Offset.zero,
      width: size.width,
      height: size.height,
    );
    var a = angle.value / 180 * pi;
    canvas.drawArc(
      rect,
      a,
      2 * pi - a.abs() * 2,
      true,
      _paint..color = color.value!,
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
