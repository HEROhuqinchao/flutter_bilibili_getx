import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/canvas_sample_time/bg_mana.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'clock_mana.dart';

class Paper extends StatefulWidget {
  const Paper({super.key});

  @override
  State<Paper> createState() => _PaperState();
}

class _PaperState extends State<Paper> {
  late Ticker _ticker;
  late ClockManage clockMana;
  late BgManage bgManage;

  @override
  void initState() {
    clockMana = ClockManage(size: Size(550, 200));
    bgManage = BgManage(size: Size(550, 200));
    _ticker = Ticker(_tick)..start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: clockMana.size,
      painter: PaperPainter(manage: clockMana),
      foregroundPainter: BgPainter(manage: bgManage),
    );
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _tick(Duration duration) {
    DateTime now = DateTime.now();
    if (now.millisecondsSinceEpoch - clockMana.datetime.millisecondsSinceEpoch >
        1000) {
      clockMana.datetime = now;
      clockMana.tick(now);
    }
    bgManage.tick(now);
  }
}

class PaperPainter extends CustomPainter {
  ClockManage manage;
  Paint clockPaint = Paint();
  Paint circlePaint = Paint()..color = Colors.red;

  PaperPainter({required this.manage}) : super(repaint: manage);

  @override
  void paint(Canvas canvas, Size size) {
    for (var p in manage.particles) {
      clockPaint.color = p.color;
      canvas.drawCircle(Offset(p.x, p.y), p.size, clockPaint);
    }
  }

  @override
  bool shouldRepaint(covariant PaperPainter oldDelegate) => false;
}

class BgPainter extends CustomPainter {
  BgManage manage;
  Paint clockPaint = Paint();

  BgPainter({required this.manage}) : super(repaint: manage);

  @override
  void paint(Canvas canvas, Size size) {
    for (var p in manage.particles) {
      clockPaint.color = p.color;
      canvas.drawCircle(Offset(p.x, p.y), p.size, clockPaint);
    }
  }

  @override
  bool shouldRepaint(covariant BgPainter oldDelegate) => false;
}
