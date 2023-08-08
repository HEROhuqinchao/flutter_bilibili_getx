import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SpringWidget(),
      ),
    );
  }
}

class SpringWidget extends StatefulWidget {
  const SpringWidget({Key? key}) : super(key: key);

  @override
  State<SpringWidget> createState() => _SpringWidgetState();
}

class _SpringWidgetState extends State<SpringWidget>
    with SingleTickerProviderStateMixin {
  double deltaDy = 0;
  late ValueNotifier<double> springHeight;
  double lastMoveLen = 0;
  late AnimationController animationController;

  @override
  void initState() {
    springHeight = ValueNotifier(100);
    animationController = AnimationController(vsync: this)
      ..addListener(() {
        deltaDy = lastMoveLen - lastMoveLen * animationController.value;
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onVerticalDragEnd: (detail) {
          lastMoveLen = deltaDy;
          animationController.forward(from: 0);
        },
        onVerticalDragUpdate: (detail) {
          deltaDy += detail.delta.dy;
          springHeight.value = -deltaDy / 1.5 + 100;
        },
        child: SizedBox(
          height: 200,
          width: 40,
          child: CustomPaint(
            painter: SpringPainter(
              height: springHeight,
              count: 21,
            ),
          ),
        ),
      ),
    );
  }
}

class SpringPainter extends CustomPainter {
  double springWidth = 40;
  double count;
  ValueNotifier<double> height;

  SpringPainter({
    required this.height,
    required this.count,
  }) : super(repaint: height);

  final Paint springPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2 + springWidth / 2, size.height);
    Path path = Path();
    path.relativeLineTo(-springWidth, 0);
    double space = height.value / (count - 1);
    for (int i = 1; i < count; i++) {
      if (i % 2 == 1) {
        path.relativeLineTo(springWidth, -space);
      } else {
        path.relativeLineTo(-springWidth, -space);
      }
    }
    if (count % 2 == 1) {
      path.relativeLineTo(springWidth, 0);
    } else {
      path.relativeLineTo(-springWidth, 0);
    }
    canvas.drawPath(path, springPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
