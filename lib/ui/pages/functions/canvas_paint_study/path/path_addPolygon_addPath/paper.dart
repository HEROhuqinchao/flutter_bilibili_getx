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
    var p0 = Offset(100, 100);
    path
      ..lineTo(100, 100)
      ..addPolygon(
        [
          p0,
          p0.translate(20, -20),
          p0.translate(40, -20),
          p0.translate(60, 0),
          p0.translate(60, 20),
          p0.translate(40, 40),
          p0.translate(20, 40),
          p0.translate(0, 20),
        ],
        true,
      )
      ..addPath(
        Path()..relativeQuadraticBezierTo(125, -100, 260, 0),
        Offset.zero,
      )
      ..lineTo(160, 100);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;
}
