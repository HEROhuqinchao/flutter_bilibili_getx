import 'dart:math';

import 'package:flutter/material.dart';

class PicManPainter extends CustomPainter {
  final Paint _paint = Paint();
  final AnimationController controller;
  ColorAngleTween colorAngleTween = ColorAngleTween(
    begin: ColorAngle(color: Colors.red, angle: 10),
    end: ColorAngle(
      angle: 40,
      color: Colors.blue,
    ),
  );

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
    var a = colorAngleTween.evaluate(controller).angle / 180 * pi;
    canvas.drawArc(
      rect,
      a,
      2 * pi - a.abs() * 2,
      true,
      _paint
        ..color = colorAngleTween.evaluate(controller).color ?? Colors.black,
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

class ColorAngle {
  double angle;
  Color? color;

  ColorAngle({required this.angle, required this.color});
}

class ColorAngleTween extends Tween<ColorAngle> {
  ColorAngleTween({
    required begin,
    required end,
  }) : super(begin: begin, end: end);

  @override
  ColorAngle transform(double t) {
    return ColorAngle(
        angle: (begin!.angle + (end!.angle - begin!.angle) * t),
        color: Color.lerp(begin!.color, end!.color, t));
  }
}
