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
    _drawTextPaintWithPaint(canvas);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;

  void _drawTextPaintWithPaint(Canvas canvas) {
    _paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.blue;
    var textPaint = TextPainter(
      text: TextSpan(
          text: 'Flutter Text 123',
          style: TextStyle(fontSize: 60, foreground: _paint)),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPaint.layout(maxWidth: 200);
    Size size = textPaint.size;
    textPaint.paint(canvas, Offset(-size.width / 2, -size.height / 2));
    canvas.drawRect(
      Rect.fromLTRB(
        -size.width / 2,
        -size.height / 2,
        size.width / 2,
        size.height / 2,
      ),
      _paint
        ..color = Colors.blue.withAlpha(33)
        ..style = PaintingStyle.fill
        ..strokeWidth = 1,
    );
  }
}
