import 'package:flutter/material.dart';

class CircleAnimation extends StatefulWidget {
  const CircleAnimation({Key? key}) : super(key: key);

  @override
  State<CircleAnimation> createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimation>
    with SingleTickerProviderStateMixin {
  final Duration animDuration = const Duration(milliseconds: 1000);
  late AnimationController _controller;
  final ColorTween colorTween = ColorTween(begin: Colors.blue, end: Colors.red);
  final CurveTween curveTween = CurveTween(curve: Curves.ease);
  late Animation<Color?> colorAnima;
  late TweenSequence tweenSequence;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: animDuration,
    );
    colorAnima = colorTween.animate(_controller);
    // colorTween.chain(curveTween);
    Animation<double> tempOne =
        CurvedAnimation(parent: _controller, curve: Curves.easeInSine);
    Animation<Color?> tempTwo = ColorTween(begin: Colors.red, end: Colors.green)
        .chain(CurveTween(curve: Curves.linear))
        .animate(_controller);
    tweenSequence = TweenSequence([
      TweenSequenceItem(
          tween: CurveTween(curve: Curves.slowMiddle), weight: 20),
      TweenSequenceItem(
          tween: CurveTween(curve: Curves.slowMiddle), weight: 40),
      TweenSequenceItem(
          tween: CurveTween(curve: Curves.slowMiddle), weight: 40),
    ]);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.forward(from: 0);
          },
          child: AnimatedBuilder(
            animation: colorAnima,
            builder: (_, __) {
              return Container(
                width: 80,
                height: 80,
                color: colorAnima.value,
                // color: Color.lerp(
                //   Colors.red,
                //   Colors.blue,
                //   _controller.value,
                // ),
                // color: tween.transform(_controller.value),
                // color: tween.evaluate(_controller),
              );
            },
          ),
        ),
      ),
    );
  }
}

main() {
  runApp(
    MaterialApp(
      home: CircleAnimation(),
    ),
  );
}
