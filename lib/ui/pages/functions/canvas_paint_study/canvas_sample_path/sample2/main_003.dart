import 'dart:math' as math;
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/mix/grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MaterialApp(home: MyApp()));
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
  final double step = 3;
  final double min = 0;
  final double max = 360 * 3.0;

  double f(double thta) => 150 * (math.sin(5 * thta)).abs();

  void initPointsWithPolar() {
    for (double x = min; x <= max; x += step) {
      double thta = (pi / 180 * x);
      var p = f(thta);
      points.add(Offset(p * cos(thta), p * sin(thta)));
    }
  }

  @override
  void initState() {
    initPointsWithPolar();
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
  List<Color> colors = [
    Color(0xFFF60C0C),
    Color(0xFFF3B913),
    Color(0xFFE7F716),
    Color(0xFF3DF30B),
    Color(0xFF0DF6EF),
    Color(0xFF0829FB),
    Color(0xFFB709F4),
  ];
  var pos = [1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];
  final Paint _linePaint = Paint();

  PathPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    _linePaint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..shader = ui.Gradient.linear(
          Offset(0, 0), Offset(100, 0), colors, pos, TileMode.mirror);
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    canvas.drawPoints(PointMode.polygon, points, _linePaint);
  }

  @override
  bool shouldRepaint(covariant PathPainter oldDelegate) => false;
}
