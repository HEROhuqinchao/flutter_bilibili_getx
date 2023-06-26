import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

const double _kDefaultSpringHeight = 100;
const double _kRateOfMove = 1.5;

class SpringWidget extends StatefulWidget {
  @override
  State<SpringWidget> createState() => _SpringWidgetState();
}

class _SpringWidgetState extends State<SpringWidget>
    with SingleTickerProviderStateMixin {
  ValueNotifier<double> height = ValueNotifier(100);
  late AnimationController animationController;
  late Animation<double> animation;
  double s = 0;
  double lastMoveLen = 0;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut)
          ..addListener(
            () {
              s = lastMoveLen * (1 - animation.value);
              height.value = _kDefaultSpringHeight + -s / _kRateOfMove;
              // print("s - $s; height - ${height.value};lastMoveLen - $lastMoveLen;");
            },
          );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    height.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (detail) {
        lastMoveLen = s;
        animationController.forward(from: 0);
      },
      onVerticalDragUpdate: (detail) {
        s += detail.delta.dy;
        height.value = _kDefaultSpringHeight + -s / _kRateOfMove;
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.grey.withAlpha(11),
        child: CustomPaint(
          painter: SpringPainter(
            height: height,
          ),
        ),
      ),
    );
  }
}

const double _kSpringWidth = 40;

class SpringPainter extends CustomPainter {
  final int count;
  final ValueNotifier<double> height;

  SpringPainter({
    this.count = 20,
    required this.height,
  }) : super(repaint: height);

  final Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

  @override
  bool shouldRepaint(covariant SpringPainter oldDelegate) =>
      oldDelegate.count != count || oldDelegate.height != height;

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
}
