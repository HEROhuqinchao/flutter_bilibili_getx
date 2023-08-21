import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/canvas_sample_animation/way1/pic_man_painter.dart';
import 'package:flutter/material.dart';

class PicMan extends StatefulWidget {
  final Color color;
  final double angle;

  PicMan({
    this.color = Colors.lightBlue,
    this.angle = 30,
  });

  @override
  State<PicMan> createState() => _PicManState();
}

class _PicManState extends State<PicMan> with SingleTickerProviderStateMixin {
  late AnimationController _controller; //动画控制器
  late Animation<double> angle;
  late Animation<Color?> color;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    color = _controller.drive(ColorTween(begin: Colors.red, end: Colors.blue));
    angle = Tween(begin: 5.0, end: 40.0).animate(_controller);
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(100, 100),
      painter: PicManPainter(
        angle: angle,
        color: color,
        controller: _controller,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
