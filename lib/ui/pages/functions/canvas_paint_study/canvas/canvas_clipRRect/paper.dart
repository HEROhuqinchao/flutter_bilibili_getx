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
  final Paint _paint = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.red.withOpacity(.8);

  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    var rect = Rect.fromCenter(center: Offset.zero, width: 200, height: 100);
    canvas.clipRRect(RRect.fromRectAndRadius(rect, Radius.circular(30)));
    canvas.drawRect(rect, _paint);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;
}
