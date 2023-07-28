import 'dart:ui';
import '../../mix/grid.dart';
import './touch_info.dart';
import 'package:flutter/material.dart';

class Paper extends StatefulWidget {
  const Paper({super.key});

  @override
  State<Paper> createState() => _PaperState();
}

class _PaperState extends State<Paper> {
  final TouchInfo touchInfo = TouchInfo();

  @override
  void dispose() {
    touchInfo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: _onPanDown,
      onPanEnd: _onPanEnd,
      onPanUpdate: _onPanUpdate,
      child: Container(
        color: Colors.white,
        child: CustomPaint(
          painter: PaperPainter(repaint: touchInfo),
        ),
      ),
    );
  }

  void _onPanDown(DragDownDetails details) {
    if (touchInfo.points.length < 3) {
      touchInfo.addPoint(details.localPosition);
    } else {
      judgeSelect(details.localPosition);
    }
  }

  void _onPanUpdate(DragUpdateDetails details) {
    judgeZone(details.localPosition, update: true);
  }

  void _onPanEnd(DragEndDetails details) {}

  void judgeSelect(Offset offset) {}

  bool judgeCircleArea(Offset src, Offset dst, double r) =>
      (src - dst).distance <= r;

  void judgeZone(Offset src, {bool update = false}) {
    for (int i = 0; i < touchInfo.points.length; i++) {
      if (judgeCircleArea(src, touchInfo.points[i], 15)) {
        touchInfo.selectIndex = i;
        if (update) {
          touchInfo.updatePoint(i, src);
        }
      }
    }
  }
}

class PaperPainter extends CustomPainter with Grid {
  Paint _helpPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;
  late final TouchInfo repaint;

  PaperPainter({required this.repaint}) : super(repaint: repaint);
  List<Offset> pos = [];

  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    pos = repaint.points
        .map((e) => Offset(e.dx - size.width / 2, e.dy - size.height / 2))
        .toList();
    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    if (pos.length < 3) {
      canvas.drawPoints(PointMode.points, pos, _helpPaint..strokeWidth = 8);
    } else {
      path.moveTo(pos[0].dx, pos[0].dy);
      path.quadraticBezierTo(pos[1].dx, pos[1].dy, pos[2].dx, pos[2].dy);
      canvas.drawPath(path, paint);
      _drawHelp(canvas);
      _drawSelectPos(canvas, size);
    }
  }

  void _drawHelp(Canvas canvas) {
    _helpPaint.color = Colors.purple;
    canvas.drawPoints(PointMode.polygon, pos, _helpPaint..strokeWidth = 1);
    canvas.drawPoints(PointMode.points, pos, _helpPaint..strokeWidth = 8);
  }

  void _drawSelectPos(Canvas canvas, Size size) {
    Offset? selectPos = repaint.selectPoint;
    if (selectPos != null) {
      canvas.drawCircle(
        Offset(selectPos.dx - size.width / 2, selectPos.dy - size.height / 2),
        10,
        _helpPaint
          ..color = Colors.green
          ..strokeWidth = 2,
      );
    }
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) => false;
}
