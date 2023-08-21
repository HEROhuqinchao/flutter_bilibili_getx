import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/mix/grid.dart';
import 'package:flutter/material.dart';

class Paper extends StatelessWidget {
  const Paper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: PaperCustomPainter(),
      ),
    );
  }
}

class PaperCustomPainter extends CustomPainter with Grid {
  Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    _drawRect(canvas);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;

  void _drawRect(Canvas canvas) {
    _paint
      ..color = Colors.blue
      ..strokeWidth = 1.5;
    Rect rectFromCenter =
        Rect.fromCenter(center: Offset.zero, width: 160, height: 160);
    canvas.drawRect(rectFromCenter, _paint);
    Rect rectFromLTRB = Rect.fromLTRB(-120, -120, -80, -80);
    canvas.drawRect(rectFromLTRB, _paint..color = Colors.red);
    Rect rectFromLTWH = Rect.fromLTWH(80, -120, 40, 40);
    canvas.drawRect(rectFromLTWH, _paint..color = Colors.orange);
    Rect rectFromCircle = Rect.fromCircle(center: Offset(100, 100), radius: 20);
    canvas.drawRect(rectFromCircle, _paint..color = Colors.green);
    Rect rectFromPoints = Rect.fromPoints(Offset(-120, 80), Offset(-80, 120));
    canvas.drawRect(rectFromPoints, _paint..color = Colors.purple);
  }
}
