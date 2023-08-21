import 'dart:ui' as ui;

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
    drawTextWithParagraph(canvas, TextAlign.center);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;

  void drawTextWithParagraph(Canvas canvas, TextAlign textAlign) {
    var builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        textAlign: textAlign,
        fontSize: 40,
        textDirection: TextDirection.ltr,
        maxLines: 1,
      ),
    );
    builder.pushStyle(
      ui.TextStyle(
          color: Colors.black87, textBaseline: ui.TextBaseline.alphabetic),
    );
    builder.addText("Flutter Text");
    ui.Paragraph paragraph = builder.build();
    paragraph.layout(const ui.ParagraphConstraints(width: 300));
    canvas.drawParagraph(paragraph, Offset.zero);
    canvas.drawRect(const Rect.fromLTRB(0, 0, 300, 40),
        _paint..color = Colors.blue.withAlpha(33));
  }
}
