import 'package:bilibili_getx/ui/pages/functions/gesture_study/part004/white_paper.dart';
import 'package:flutter/material.dart';

main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: Center(
          child: WhitePaper(),
        ),
      ),
    );
  }
}