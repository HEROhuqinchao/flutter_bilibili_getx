import 'package:flutter/material.dart';

class Paper extends StatelessWidget {
  const Paper({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class PaperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    drawIsAntiAliasColor(canvas);
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) => false;

  void drawIsAntiAliasColor(Canvas canvas) {
    Paint paint = Paint();
    canvas.drawCircle(
      const Offset(100, 100),
      170,
      paint
        ..color = Colors.blue
        ..strokeWidth = 5,
    );
    canvas.drawCircle(
      const Offset(180 + 360.0, 180),
      170,
      paint
        ..isAntiAlias = false
        ..color = Colors.red,
    );
  }
}