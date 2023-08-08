import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: SpringWidget(),
        ),
      ),
    );
  }
}

class SpringWidget extends StatefulWidget {
  @override
  State<SpringWidget> createState() => _SpringWidgetState();
}

class _SpringWidgetState extends State<SpringWidget>
    with SingleTickerProviderStateMixin {
  ValueNotifier<double> height = ValueNotifier(100);

  double s = 0;

  final double _kDefaultSpringHeight = 100;

  final double _kRateOfMove = 1.5;

  double get dx => -s / _kRateOfMove;

  late AnimationController animationController;
  late Animation<double> animation;

  double backLen = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    animation = CurveTween(curve: Interpolator()).animate(animationController);
    animation.addListener(() {
      s = backLen - backLen * animation.value;
      height.value = _kDefaultSpringHeight + dx;
    });
  }

  @override
  void dispose() {
    height.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (detail) {
        s += detail.delta.dy;
        height.value = _kDefaultSpringHeight + dx;
      },
      onVerticalDragEnd: (detail) {
        backLen = s;
        animationController.forward(from: 0);
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.grey.withAlpha(11),
        child: CustomPaint(
          painter: SpringPainter(height: height),
        ),
      ),
    );
  }
}

class SpringPainter extends CustomPainter {
  late int count;

  SpringPainter({this.count = 40, required this.height})
      : super(repaint: height);

  late ValueListenable height;

  final Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;
  final double _kSpringWidth = 20;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2 + _kSpringWidth / 2, size.height);
    Path springPath = Path();
    springPath.relativeLineTo(-_kSpringWidth, 0);
    double space = height.value / (count - 1);
    for (int i = 1; i < count; i++) {
      if (i % 2 == 1) {
        springPath.relativeLineTo(_kSpringWidth, -space);
      } else {
        springPath.relativeLineTo(-_kSpringWidth, -space);
      }
    }
    springPath.relativeLineTo(count.isOdd ? _kSpringWidth : -_kSpringWidth, 0);
    canvas.drawPath(springPath, _paint);
  }

  @override
  bool shouldRepaint(covariant SpringPainter oldDelegate) {
    return oldDelegate.count != count || oldDelegate.height != height;
  }
}

class Interpolator extends Curve {
  @override
  double transformInternal(double t) {
    t -= 1.0;
    return t * t * t * t * t + 1.0;
  }
}
