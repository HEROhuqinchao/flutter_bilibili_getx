import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'handle_widget.dart';

main() {
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
    return Home();
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double rotation = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          children: [
            Container(
              color: Colors.black,
              child: HandleWidget(
                onMove: (r, d) {
                  rotation = r;
                  setState(() {});
                },
              ),
            ),
            Transform.rotate(
              angle: rotation,
              child: Container(
                color: Colors.green,
                width: 100,
                height: 100,
                alignment: Alignment.center,
                child: const Text("contain"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
