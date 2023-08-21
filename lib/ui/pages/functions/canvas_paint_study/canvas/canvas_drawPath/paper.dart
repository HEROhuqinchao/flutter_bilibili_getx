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
  final Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    drawPath(canvas);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;

  drawPath(Canvas canvas) {
    Path path = Path();
    path.lineTo(60, 60);
    path.lineTo(-60, 60);
    path.lineTo(60, -60);
    path.lineTo(-60, -60);
    path.close();
    canvas.drawPath(
      path,
      _paint
        ..style = PaintingStyle.fill
        ..strokeWidth = 2
        ..color = Colors.blue,
    );
    canvas.translate(140, 0);
    canvas.drawPath(
      path,
      _paint
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = Colors.blue,
    );
  }
}
