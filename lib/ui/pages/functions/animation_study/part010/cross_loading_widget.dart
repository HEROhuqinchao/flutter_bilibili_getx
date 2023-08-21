import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Center(child: CrossLoadingWidget()),
    );
  }
}

class CrossLoadingWidget extends StatefulWidget {
  @override
  State<CrossLoadingWidget> createState() => _CrossLoadingWidgetState();
}

class _CrossLoadingWidgetState extends State<CrossLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CrossLoadingPainter(
        33,
        animationController,
      ),
    );
  }
}

class CrossLoadingPainter extends CustomPainter {
  late double itemWidth;
  final Paint _paint = Paint();
  double span = 15;
  late Animation<double> animation;

  CrossLoadingPainter(this.itemWidth, this.animation)
      : super(repaint: animation);

  final List<Color> colors = [
    Color(0xffF44336),
    Color(0xff5C6BC0),
    Color(0xffFFB74D),
    Color(0xff8BC34A)
  ];
  Animatable<double> tweenSequence = TweenSequence([
    TweenSequenceItem<double>(
      tween: Tween(begin: -1.0, end: 0.0).chain(
        CurveTween(curve: Curves.decelerate),
      ),
      weight: 1,
    ),
    TweenSequenceItem(
      tween: Tween(begin: 0.0, end: 1.0).chain(
        CurveTween(curve: Curves.easeIn),
      ),
      weight: 1,
    ),
  ]);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
        Offset.zero & size, Paint()..color = Colors.grey.withAlpha(11));
    canvas.translate(size.width / 2, size.height / 2);
    Offset offset = Offset(
        0, (-itemWidth / sqrt(2) - span) * tweenSequence.evaluate(animation));
    drawDiamond(canvas, offset, colors[0]);
    offset = Offset(
        0, (itemWidth / sqrt(2) + span) * tweenSequence.evaluate(animation));
    drawDiamond(canvas, offset, colors[1]);
    offset = Offset(
        (-itemWidth / sqrt(2) - span) * tweenSequence.evaluate(animation), 0);
    drawDiamond(canvas, offset, colors[2]);
    offset = Offset(
        (itemWidth / sqrt(2) + span) * tweenSequence.evaluate(animation), 0);
    drawDiamond(canvas, offset, colors[3]);
  }

  @override
  bool shouldRepaint(CrossLoadingPainter oldDelegate) {
    return oldDelegate.itemWidth != itemWidth;
  }

  void drawDiamond(Canvas canvas, Offset offset, Color color) {
    canvas.save();
    canvas.translate(offset.dx, offset.dy);
    canvas.rotate(45 / 180 * pi);
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset.zero, width: itemWidth, height: itemWidth),
        _paint
          ..color = color
          ..style = PaintingStyle.fill);
    canvas.restore();
  }
}
