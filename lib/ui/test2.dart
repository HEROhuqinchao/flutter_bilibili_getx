import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlatformViewDemo(),
    );
  }
}

class PlatformViewDemo extends StatelessWidget {
  const PlatformViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget platformView() {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return AndroidView(viewType: 'history_chart_view');
      }
      return Container(child: Text("非android平台"),);
    }
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: platformView(),
      ),
    );
  }
}

