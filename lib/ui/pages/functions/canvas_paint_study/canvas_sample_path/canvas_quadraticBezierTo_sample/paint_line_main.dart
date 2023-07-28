import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/mix/grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MaterialApp(home: MyApp()));
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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<Offset> points = [];
  final double step = 3;
  final double min = 0;
  final double max = 360 * 3.0;

  late final AnimationController animationController;

  double f(double thta) => 50 * (2 * sin(2 * thta).abs() + sin(4 * thta).abs());

  void initPoints() {
    for (double x = min; x <= max; x += step) {
      double thta = (pi / 180 * x);
      double p = f(thta);
      points.add(Offset(p * cos(thta), p * sin(thta)));
    }
  }

  @override
  void initState() {
    initPoints();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..forward(from: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        size: MediaQuery.of(context).size,
        painter: PathPainter(points: points, repaint: animationController),
      ),
    );
  }
}

class PathPainter extends CustomPainter with Grid {
  final List<Offset> points;
  final Paint _linePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3
    ..shader = ui.Gradient.linear(
      Offset.zero,
      Offset(100, 0),
      colors,
      pos,
      TileMode.mirror,
    );
  Animation<double> repaint;

  PathPainter({required this.points, required this.repaint})
      : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    drawGrid(canvas, size);
    drawAxis(canvas, size);
    drawPathQuadraticBezier(canvas);
    // canvas.drawPoints(PointMode.polygon, points, _linePaint);
  }

  @override
  bool shouldRepaint(covariant PathPainter oldDelegate) {
    return true;
  }

  void drawPathQuadraticBezier(Canvas canvas) {
    Offset p1 = points[0];
    Path path = Path()..moveTo(p1.dx, p1.dy);
    for (var i = 1; i < points.length - 1; i++) {
      double xc = (points[i].dx + points[i + 1].dx) / 2;
      double yc = (points[i].dy + points[i + 1].dy) / 2;
      Offset p2 = points[i];
      path.quadraticBezierTo(p2.dx, p2.dy, xc, yc);
    }
    // canvas.drawPath(path, _linePaint);

    PathMetrics pms = path.computeMetrics();
    for (var pm in pms) {
      Tangent? tangent = pm.getTangentForOffset(pm.length * repaint.value);
      canvas.drawPath(pm.extractPath(0, pm.length * repaint.value), _linePaint);
      canvas.drawCircle(tangent!.position, 5, Paint()..color = Colors.blue);
    }
  }
}
