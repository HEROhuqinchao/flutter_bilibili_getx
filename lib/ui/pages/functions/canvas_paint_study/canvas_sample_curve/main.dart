import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'curve_box.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Wrap(
          children: [
            CurveBox(curve: Curves.bounceInOut),
            CurveBox(curve: Curves.bounceIn),
            CurveBox(curve: Curves.linear),
            CurveBox(curve: Curves.bounceOut),
            CurveBox(curve: Curves.decelerate),
            CurveBox(curve: Curves.fastEaseInToSlowEaseOut),
            CurveBox(curve: Curves.elasticIn),
            CurveBox(curve: Curves.ease),
            CurveBox(curve: Curves.easeIn),
            CurveBox(curve: Curves.easeInBack),
            CurveBox(curve: Curves.easeInCirc),
            CurveBox(curve: Curves.easeInCubic),
            CurveBox(curve: Curves.easeInExpo),
            CurveBox(curve: Curves.easeInOut),
            CurveBox(curve: Curves.easeInOutBack),
          ],
        ),
      ),
    );
  }
}
