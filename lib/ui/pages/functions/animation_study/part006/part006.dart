import 'package:flutter/material.dart';

class Part006 extends StatefulWidget {
  const Part006({Key? key}) : super(key: key);

  @override
  State<Part006> createState() => _Part006State();
}

class _Part006State extends State<Part006> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late TweenSequence<double> tweenSequence;
  late TextStyleTween textStyleTween = TextStyleTween(
    begin: TextStyle(color: Colors.blue, fontSize: 14, letterSpacing: 4),
    end: TextStyle(color: Colors.purple, fontSize: 40, letterSpacing: 10),
  );

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      value: 0,
    );
    tweenSequence = TweenSequence([
      TweenSequenceItem(
          tween: CurveTween(curve: Curves.decelerate), weight: 20),
      TweenSequenceItem(tween: CurveTween(curve: Curves.linear), weight: 60),
      TweenSequenceItem(
          tween: CurveTween(curve: Curves.easeInBack), weight: 20),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          animationController.reset();
          animationController.forward();
        },
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (ctx, child) {
            return Text(
              "变化的文字",
              style: textStyleTween.transform(animationController.value),
            );
          },
        ),
      ),
    );
  }
}

main() {
  runApp(MaterialApp(
    home: Part006(),
  ));
}

class Circle {
  Color? color;
  double? radius;
  Offset? center;

  Circle({
    required this.color,
    required this.radius,
    required this.center,
  });
}

class CircleTween extends Tween<Circle> {
  CircleTween({required Circle begin, required Circle end})
      : super(begin: begin, end: end);

  @override
  Circle lerp(double t) {
    return Circle(
      color: Color.lerp(begin?.color, end?.color, t)!,
      radius: (begin!.radius! + (end!.radius! - begin!.radius!) * t),
      center: Offset.lerp(begin?.center, end?.center, t),
    );
  }
}
