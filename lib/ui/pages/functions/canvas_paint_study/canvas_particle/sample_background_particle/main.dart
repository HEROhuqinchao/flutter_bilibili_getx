import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './world.dart';

main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: World()));
  }
}
