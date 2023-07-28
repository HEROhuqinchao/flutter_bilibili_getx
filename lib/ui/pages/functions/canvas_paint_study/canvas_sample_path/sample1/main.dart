import 'dart:ui';

import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/mix/grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Offset> points = [];
  final double step = 10;
  final double min = -240;
  final double max = 240;

  double f(double x) => -x * x / 200 + 100;

  void initPoints() {
    for (double x = min; x <= max; x += step) {
      points.add(Offset(x, f(x)));
    }
  }

  @override
  void initState() {
    initPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        size: MediaQuery.of(context).size,
        painter: PathPainter(points: points),
      ),
    );
  }
}

class PathPainter extends CustomPainter with Grid {
  final List<Offset> points;
  final Paint _linePaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = Colors.red
    ..strokeWidth = 3;

  PathPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    canvas.drawPoints(PointMode.polygon, points, _linePaint);
    // canvas.drawPoints(PointMode.points, points, _linePaint);
  }

  @override
  bool shouldRepaint(covariant PathPainter oldDelegate) {
    return true;
  }
}
