import 'package:bilibili_getx/ui/pages/functions/gesture_study/part006/raw_gesture_detector_demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(
    const Directionality(
      textDirection: TextDirection.ltr,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const RawGestureDetectorDemo();
  }
}
