import 'dart:ui';

import 'package:flutter/material.dart';

import '../mix/grid.dart';

class Paper extends StatelessWidget {
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
  Paint _pointsPaint = Paint();
  final List<Offset> points = [
    Offset(10, 10),
    Offset(30, 50),
    Offset(60, 80),
    Offset(100, 100),
  ];
  Paint _linePaint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size);
    _drawPointsWithPoints(canvas);
    _drawPointsWithLines(canvas);
    // _drawPointLineWithPolygon(canvas);
  }

  @override
  bool shouldRepaint(covariant PaperCustomPainter oldDelegate) => false;

  void _drawPointsWithPoints(Canvas canvas) {
    _pointsPaint
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.points, points, _pointsPaint);
  }

  void _drawPointsWithLines(Canvas canvas) {
    _linePaint
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.lines, points, _linePaint);
  }

  void _drawPointLineWithPolygon(Canvas canvas) {
    _linePaint
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.polygon, points, _linePaint);
  }
}
