import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircleHero()),
    );
  }
}

class CircleHero extends StatefulWidget {
  const CircleHero({Key? key}) : super(key: key);

  @override
  State<CircleHero> createState() => _CircleHeroState();
}

class _CircleHeroState extends State<CircleHero>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    colors.addAll(colors.reversed.toList());
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: CircleHaloPaint(animationController),
    );
  }
}

List<Color> colors = [
  Color(0xFFF60C0C),
  Color(0xFFF3B913),
  Color(0xFFE7F716),
  Color(0xFF3DF30B),
  Color(0xFF0DF6EF),
  Color(0xFF0829FB),
  Color(0xFFB709F4),
];

class CircleHaloPaint extends CustomPainter {
  Animation<double> animation;

  CircleHaloPaint(this.animation) : super(repaint: animation);

  final Animatable<double> breathTween = TweenSequence<double>([
    TweenSequenceItem<double>(tween: Tween(begin: 0, end: 4), weight: 1),
    TweenSequenceItem<double>(tween: Tween(begin: 4, end: 0), weight: 1),
  ]).chain(CurveTween(curve: Curves.decelerate));

  @override
  void paint(Canvas canvas, Size size) {
    ///背景彩色圆环
    final List<double> pos =
        List.generate(colors.length, (index) => index / colors.length);
    canvas.translate(size.width / 2, size.height / 2);
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..maskFilter = MaskFilter.blur(
        BlurStyle.solid,
        breathTween.evaluate(animation),
      )
      ..shader = ui.Gradient.sweep(
          Offset.zero, colors, pos, TileMode.clamp, 0, 2 * pi);
    final Path circlePath = Path()
      ..addOval(Rect.fromCenter(center: Offset(0, 0), width: 100, height: 100));
    canvas.drawPath(circlePath, paint);

    ///旋转圆弧
    final Paint paintHalfCircle = Paint()
      ..style = PaintingStyle.fill
      ..color = Color(0xff00abf2);
    final Path halfCirclePath = Path()
      ..addOval(Rect.fromCenter(center: Offset(0, 0), width: 100, height: 100));
    Path halfCircle2Path = Path()
      ..addOval(
          Rect.fromCenter(center: Offset(-1, 0), width: 100, height: 100));
    Path result =
        Path.combine(PathOperation.difference, halfCirclePath, halfCircle2Path);
    canvas.save();
    canvas.rotate(animation.value * 2 * pi);
    canvas.drawPath(result, paintHalfCircle);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CircleHaloPaint oldDelegate) {
    return oldDelegate.animation != animation;
  }
}
