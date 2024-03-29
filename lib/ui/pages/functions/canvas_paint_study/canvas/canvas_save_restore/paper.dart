import 'package:flutter/material.dart';

class Paper extends StatelessWidget {
  const Paper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PaperPainter(),
    );
  }
}

class PaperPainter extends CustomPainter {
  late Paint _gridPaint;
  final double step = 20;
  final double strokeWidth = .5;
  final Color color = Colors.grey;

  PaperPainter() {
    _gridPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _drawGrid(canvas, size);
    drawCircle(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void _drawBottomRight(Canvas canvas, Size size) {
    canvas.save();
    for (int i = 0; i < size.height / 2 / step; i++) {
      canvas.drawLine(Offset(0, 0), Offset(size.width / 2, 0), _gridPaint);
      canvas.translate(0, step);
    }
    canvas.restore();
  }

  void _drawGrid(Canvas canvas, Size size) {
    _drawBottomRight(canvas, size);
    canvas.save();
    canvas.scale(1, -1);
    _drawBottomRight(canvas, size);
    canvas.restore();
    canvas.scale(-1, 1);
    canvas.save();
    _drawBottomRight(canvas, size);
    canvas.restore();
    canvas.scale(-1, -1);
    canvas.save();
    _drawBottomRight(canvas, size);
    canvas.restore();
  }

  void drawCircle(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;
    canvas.translate(size.width / 2, size.height / 2);
    canvas.drawCircle(Offset(0, 0), 50, paint);
    canvas.drawLine(
      Offset(20, 20),
      Offset(50, 50),
      paint
        ..color = Colors.red
        ..strokeWidth = 5
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
    );
  }
}
