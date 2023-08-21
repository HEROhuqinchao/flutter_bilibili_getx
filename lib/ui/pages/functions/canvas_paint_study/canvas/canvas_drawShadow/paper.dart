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
  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    drawShadow(canvas);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;

  drawShadow(Canvas canvas) {
    Path path = Path();
    path.lineTo(80, 80);
    path.lineTo(-80, 80);
    path.close();
    canvas.drawShadow(path, Colors.blue, 3, true);
    canvas.translate(200, 0);
    canvas.drawShadow(path, Colors.red, 3, false);
  }
}
