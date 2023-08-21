import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomPaint(
        size: Size(100, 100),
        foregroundPainter: BgPainter(),
      ),
    );
  }
}

class BgPainter extends CustomPainter {
  final Paint _paint = Paint()
    ..color = Colors.yellow
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);
    canvas.drawPaint(Paint()..color = Colors.red);
    drawArcDetail(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void drawArcDetail(Canvas canvas) {
    canvas.drawArc(
      const Rect.fromLTWH(0, 0, 100, 100),
      15 / 180 * pi,
      330 / 180 * pi,
      true,
      _paint,
    );
    canvas.drawCircle(Offset(150, 50), 10, _paint);
  }
}
