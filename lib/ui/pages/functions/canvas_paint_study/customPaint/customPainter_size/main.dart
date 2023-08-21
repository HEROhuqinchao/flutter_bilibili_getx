import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildChild003(),
    );
  }

  Widget _buildChild001() {
    final Widget just = CustomPaint(
      size: const Size(100, 100),
      painter: BgPainter(),
    );
    return just;
  }

  Widget _buildChild002() {
    final Widget just = CustomPaint(
      painter: BgPainter(),
      child: const SizedBox(
        width: 100,
        height: 100,
      ),
    );
    return just;
  }

  Widget _buildChild003() {
    final Widget withLayoutBuilder = LayoutBuilder(builder: _buildByLayout);
    return withLayoutBuilder;
  }

  Widget _buildByLayout(BuildContext context, BoxConstraints constraints) {
    return CustomPaint(
      size: Size(constraints.maxWidth, constraints.maxHeight),
      painter: BgPainter(),
    );
  }
}

class BgPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromPoints(Offset.zero, Offset(size.width, size.height)),
      Paint()..color = Colors.red,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
