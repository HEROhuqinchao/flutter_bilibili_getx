import 'dart:math';

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
      body: Center(
        child: RotateLoading(),
      ),
    );
  }
}

class RotateLoading extends StatefulWidget {
  const RotateLoading({Key? key}) : super(key: key);

  @override
  State<RotateLoading> createState() => _RotateLoadingState();
}

class _RotateLoadingState extends State<RotateLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
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
      painter: RotateLoadingPainter(33, animationController),
    );
  }
}

class RotateLoadingPainter extends CustomPainter {
  RotateLoadingPainter(this.itemWidth, this.animation) : super(repaint: animation);

  Animation<double> animation;

  final List<Color> colors = [
    Color(0xffF44336), Color(0xff5C6BC0), Color(0xffFFB74D), Color(0xff8BC34A)
  ];

  final double itemWidth;
  final Paint _paint = Paint();
  final double span = 16;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(animation.value * 2 * pi);
    final double len = itemWidth / 2 + span / 2;
    Offset centerA = Offset(-len, -len);
    drawItem(canvas, centerA, colors[0]);
    Offset centerB = Offset(-len, len);
    drawItem(canvas, centerB, colors[1]);
    Offset centerC = Offset(len, len);
    drawItem(canvas, centerC, colors[2]);
    Offset centerD = Offset(len, -len);
    drawItem(canvas, centerD, colors[3]);
  }

  void drawItem(Canvas canvas, Offset center, Color color) {
    Rect rect = Rect.fromCenter(
        center: center, width: itemWidth, height: itemWidth);
    canvas.save();
    ///偏移到方块中心点
    canvas.translate(center.dx, center.dy);
    canvas.rotate(Tween(begin: pi, end: -pi).chain(CurveTween(curve: Curves.easeIn)).transform(animation.value));
    ///偏移到原来的中心点
    canvas.translate(-center.dx, -center.dy);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(5)),
        _paint..color = color);
    canvas.restore();
  }

  @override
  bool shouldRepaint(RotateLoadingPainter oldDelegate) {
    return oldDelegate.itemWidth != itemWidth;
  }
}
