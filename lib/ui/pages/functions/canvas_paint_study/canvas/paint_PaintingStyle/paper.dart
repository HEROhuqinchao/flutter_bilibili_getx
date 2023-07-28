import 'package:flutter/material.dart';

class Paper extends StatelessWidget {
  const Paper({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PaperPainter(),
    );
  }
}

class PaperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    drawStyleStrokeWidth(canvas);
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) => false;

  void drawStyleStrokeWidth(Canvas canvas) {
    Paint paint = Paint()..color = Colors.red;
    canvas.drawCircle(
      Offset(180, 180),
      150,
      paint
        ..style = PaintingStyle.stroke
        ..strokeWidth = 50,
    );
    canvas.drawCircle(
      Offset(180 + 360, 180),
      150,
      paint
        ..style = PaintingStyle.fill
        ..strokeWidth = 50,
    );
  }
}
