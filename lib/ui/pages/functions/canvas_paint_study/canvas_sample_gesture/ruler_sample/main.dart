import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/canvas_sample_gesture/ruler_sample/ruler_chooser.dart';
import 'package:flutter/cupertino.dart';
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
    return const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double nowValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          children: [
            RulerChooser(
              onChanged: (x) {
                nowValue = x;
                setState(() {});
              },
            ),
            Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              child: Text("$nowValue"),
            ),
          ],
        ),
      ),
    );
  }
}
