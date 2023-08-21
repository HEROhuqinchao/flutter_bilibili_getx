import 'dart:ui';

import 'package:bilibili_getx/ui/pages/functions/gesture_study/part004/point.dart';
import 'package:flutter/material.dart';

enum PaintState {
  doing,
  done,
  hide,
  edit,
}

///线类
class Line {
  List<Point> points = [];
  PaintState state;
  double strokeWidth;
  Color color;
  Path _linePath = Path();
  late Path _recodePath = Path();

  Path get path => _linePath;

  Line({
    this.state = PaintState.doing,
    this.strokeWidth = 1,
    this.color = Colors.black,
  });

  void paint(Canvas canvas, Paint paint) {
    paint
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    if (state == PaintState.doing) {
      _linePath = formPath();
    }
    if (state == PaintState.edit) {
      Paint paint1 = Paint()
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke
        ..color = Colors.deepPurpleAccent;
      canvas.drawRect(
        Rect.fromCenter(
          center: _linePath.getBounds().center,
          width: _linePath.getBounds().width,
          height: _linePath.getBounds().height,
        ),
        paint1,
      );
    }
    canvas.drawPath(_linePath, paint);

    Path p1 =
        _linePath.shift(Offset(paint.strokeWidth / 2, paint.strokeWidth / 2));
    Path p2 =
        _linePath.shift(Offset(-paint.strokeWidth / 2, -paint.strokeWidth / 2));
    Paint paint1 = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..color = Colors.red;
    canvas.drawPath(p1, paint1);
    canvas.drawPath(p2, paint1);
    // canvas.drawPoints(
    //   PointMode.polygon,
    //   points.map((e) => e.toOffset()).toList(),
    //   paint,
    // );
  }

  Path formPath() {
    Path path = Path();
    for (int i = 0; i < points.length - 1; i++) {
      Point current = points[i];
      Point next = points[i + 1];
      if (i == 0) {
        path.moveTo(current.x, current.y);
        path.lineTo(next.x, next.y);
      } else if (i <= points.length - 2) {
        double xc = (points[i].x + points[i + 1].x) / 2;
        double yc = (points[i].y + points[i + 1].y) / 2;
        Point p2 = points[i];
        path.quadraticBezierTo(p2.x, p2.y, xc, yc);
      } else {
        path.moveTo(current.x, current.y);
        path.lineTo(next.x, next.y);
      }
    }
    return path;
  }

  void recode() {
    _recodePath = path.shift(Offset.zero);
  }

  void translate(Offset offset) {
    _linePath = _recodePath.shift(offset);
  }
}
