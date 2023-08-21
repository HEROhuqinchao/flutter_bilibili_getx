import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/mix/grid.dart';
import 'package:flutter/material.dart';

class Paper extends StatelessWidget {
  const Paper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.white,
      child: CustomPaint(
        painter: PaperCustomPainter(),
      ),
    );
  }
}

class PaperCustomPainter extends CustomPainter with Grid {
  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.deepPurpleAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    path
      ..lineTo(100, 100)
      ..relativeLineTo(0, -50)
      ..close();
    canvas.drawPath(path, paint);
    canvas.drawPath(path.shift(Offset(100, 0)), paint);
    canvas.drawPath(path.shift(Offset(200, 0)), paint);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;
}