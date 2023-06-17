import 'package:flutter/material.dart';

class AnimationCurve extends StatefulWidget {
  const AnimationCurve({Key? key}) : super(key: key);

  @override
  State<AnimationCurve> createState() => _AnimationCurveState();
}

class _AnimationCurveState extends State<AnimationCurve>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  Duration animationDuration = Duration(seconds: 3);
  late Animation<double> curveAnim;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    )..addListener(
        () {
          print(curveAnim.value);
        },
      );
    curveAnim =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: curveAnim,
      builder: (ctx, child) {
        return Container(
          color: Colors.lightBlue,
          height: curveAnim.value * 100,
          width: curveAnim.value * 100,
        );
      },
    );
  }
}

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: AnimationCurve(),
      ),
    ),
  );
}
