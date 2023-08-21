import 'dart:ui';

import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/mix/grid.dart';
import 'package:flutter/material.dart';

import '../draw_sample_cubicTo/touch_info.dart';

class Paper extends StatefulWidget {
  const Paper({super.key});

  @override
  State<Paper> createState() => _PaperState();
}

class _PaperState extends State<Paper> {
  final rate = 0.551915024494;
  final double _radius = 150;
  final TouchInfo touchInfo = TouchInfo();

  @override
  void initState() {
    touchInfo.setPoints(_initPoints());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      child: CustomPaint(
        painter: PaperPainter(repaint: touchInfo),
      ),
    );
  }

  List<Offset> _initPoints() {
    final List<Offset> pos = [];
    //第一段线
    pos.add(Offset(0, rate) * _radius);
    pos.add(Offset(1 - rate, 1) * _radius);
    pos.add(const Offset(1, 1) * _radius);
    //第二段线
    pos.add(Offset(1 + rate, 1) * _radius);
    pos.add(Offset(2, rate) * _radius);
    pos.add(Offset(2, 0) * _radius);
    //第三段线
    pos.add(Offset(2, -rate) * _radius);
    pos.add(Offset(1 + rate, -1) * _radius);
    pos.add(Offset(1, -1) * _radius);
    //第四段线
    pos.add(Offset(1 - rate, -1) * _radius);
    pos.add(Offset(0, -rate) * _radius);
    pos.add(Offset(0, 0));
    return pos;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    judgeZone(details.localPosition, update: true);
  }

  bool judgeCircleArea(Offset src, Offset dst, double r) =>
      (src - dst).distance <= r;

  bool judgeZone(Offset src, {bool update = false}) {
    Size size = MediaQuery.of(context).size;
    src = src.translate(-size.width / 2, -size.height / 2);
    for (int i = 0; i < touchInfo.points.length; i++) {
      if (judgeCircleArea(src, touchInfo.points[i], 15)) {
        touchInfo.selectIndex = i;
        if (update) {
          touchInfo.updatePoint(i, src);
        }
        return true;
      }
    }
    return false;
  }
}

class PaperPainter extends CustomPainter with Grid {
  final Paint _helpPaint = Paint()
    ..color = Colors.purple
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;
  final TouchInfo repaint;
  List<Offset> pos = [];

  PaperPainter({required this.repaint}) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    pos = repaint.points;
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    path.moveTo(0, 0);
    for (int i = 0; i < pos.length / 3; i++) {
      path.cubicTo(
        pos[i * 3].dx,
        pos[i * 3].dy,
        pos[i * 3 + 1].dx,
        pos[i * 3 + 1].dy,
        pos[i * 3 + 2].dx,
        pos[i * 3 + 2].dy,
      );
    }
    canvas.drawPath(path, paint);
    _drawHelp(canvas);
    _drawSelectPos(canvas, size);
  }

  void _drawHelp(Canvas canvas) {
    _helpPaint
      ..strokeWidth = 1
      ..color = Colors.purple;
    canvas.drawLine(pos[0], pos[11], _helpPaint);
    canvas.drawLine(pos[1], pos[2], _helpPaint);
    canvas.drawLine(pos[2], pos[3], _helpPaint);
    canvas.drawLine(pos[4], pos[5], _helpPaint);
    canvas.drawLine(pos[5], pos[6], _helpPaint);
    canvas.drawLine(pos[7], pos[8], _helpPaint);
    canvas.drawLine(pos[8], pos[9], _helpPaint);
    canvas.drawLine(pos[10], pos[11], _helpPaint);
    canvas.drawLine(pos[11], pos[0], _helpPaint);
    canvas.drawPoints(PointMode.points, pos, _helpPaint..strokeWidth = 8);
  }

  void _drawSelectPos(Canvas canvas, Size size) {
    Offset? selectPos = repaint.selectPoint;
    if (selectPos == null) return;
    canvas.drawCircle(
      selectPos,
      10,
      _helpPaint
        ..color = Colors.green
        ..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) => false;
}
