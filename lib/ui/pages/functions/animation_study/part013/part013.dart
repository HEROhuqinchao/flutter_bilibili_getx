import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
    return TickerDemo();
  }
}

class TickerDemo extends StatefulWidget {
  const TickerDemo({super.key});

  @override
  State<TickerDemo> createState() => _TickerDemoState();
}

class _TickerDemoState extends State<TickerDemo> {
  late Ticker ticker;

  @override
  void initState() {
    ticker = Ticker((elapsed) {
      _tick(elapsed);
    });
    super.initState();
  }

  void _tick(Duration elapsed) {
    print('----elapsed:$elapsed------');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            if(ticker.isTicking) {
              ticker.stop();
            } else {
              ticker.start();
            }
          },
          child: Container(
            width: 60,
            height: 60,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    ticker.dispose();
    super.dispose();
  }
}
