import 'dart:math';

import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: RoundLoadingWidget()),
    );
  }
}

class RoundLoadingWidget extends StatefulWidget {
  const RoundLoadingWidget({Key? key}) : super(key: key);

  @override
  State<RoundLoadingWidget> createState() => _RoundLoadingWidgetState();
}

class _RoundLoadingWidgetState extends State<RoundLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: CustomPaint(
        painter: RoundLoadingPainter(
          15,
          animationController,
          75,
          50,
        ),
      ),
    );
  }
}

class RoundLoadingPainter extends CustomPainter {
  late double radius;
  late Animation<double> animation;
  final Paint _paint = Paint();
  late double k;
  late double l;

  RoundLoadingPainter(
    this.radius,
    this.animation,
    this.k,
    this.l,
  ) : super(repaint: animation);

  final List<Color> colors = [
    Color(0xffF44336),
    Color(0xff5C6BC0),
    Color(0xffFFB74D),
    Color(0xff8BC34A)
  ];

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawItem(canvas, 0, colors[0]);
    drawItem(canvas, pi / 2, colors[1]);
    drawItem(canvas, -pi / 2, colors[2]);
    drawItem(canvas, pi, colors[3]);
  }

  @override
  bool shouldRepaint(RoundLoadingPainter oldDelegate) {
    return oldDelegate.radius != radius;
  }

  void drawItem(Canvas canvas, double rad, Color color) {
    double x = f(animation.value) * k;
    double y = g(animation.value) * l;
    canvas.save();
    canvas.rotate(rad);
    canvas.drawCircle(Offset(x, y), radius, _paint..color = color);
    canvas.restore();
  }

  double f(double t) => cos(t * pi * 2);

  double g(double t) => sin(t * pi * 2);
}
