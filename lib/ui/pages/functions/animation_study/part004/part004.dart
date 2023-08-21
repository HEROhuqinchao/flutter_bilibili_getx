import 'package:bilibili_getx/ui/pages/functions/animation_study/anim_painter/anim_painter.dart';
import 'package:bilibili_getx/ui/pages/functions/animation_study/part004/point_data_notifier.dart';
import 'package:flutter/material.dart';

class X2Curve extends Curve {
  const X2Curve();

  @override
  double transformInternal(double t) {
    return t * t;
  }
}

class DampingCurve extends Curve {
  DampingCurve();

  @override
  double transformInternal(double t) {
    t = t - 1.0;
    return t * t * t * t * t + 1.0;
  }
}

class Part004 extends StatefulWidget {
  const Part004({Key? key}) : super(key: key);

  @override
  State<Part004> createState() => _Part004State();
}

class _Part004State extends State<Part004> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late PointDataNotifier pointDataNotifier;

  @override
  void initState() {
    pointDataNotifier = PointDataNotifier([]);
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      value: 0,
    )..addListener(() {
        // pointDataNotifier.push(animation.value);
        // pointDataNotifier
        //     .push(Curves.decelerate.transform(animationController.value));
        pointDataNotifier
            .push(DampingCurve().transform(animationController.value));
      });
    animation = CurvedAnimation(
      parent: animationController,
      curve: DampingCurve(),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    pointDataNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pointDataNotifier.clear();
          animationController.forward(from: 0);
        },
      ),
      body: Center(
        child: CustomPaint(
          painter: AnimPainter(pointDataNotifier),
          size: Size(200, 200),
        ),
      ),
    );
  }
}

main() {
  runApp(
    MaterialApp(
      home: Part004(),
    ),
  );
}
