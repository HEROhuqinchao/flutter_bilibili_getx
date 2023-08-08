import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gesture_painter.dart';

main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
  final ValueNotifier<Matrix4> matrix =
      ValueNotifier<Matrix4>(Matrix4.identity());
  Matrix4 recodeMatrix = Matrix4.identity();
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.cyanAccent.withOpacity(.1),
          width: 300,
          height: 300,
          child: GestureDetector(
            onScaleUpdate: _onScaleUpdate,
            onScaleEnd: _onScaleEnd,
            child: CustomPaint(
              painter: GesturePainter(matrix),
            ),
          ),
        ),
      ),
    );
  }

  _onScaleUpdate(ScaleUpdateDetails detail) {
    if (detail.pointerCount == 1) {
      matrix.value = Matrix4.translationValues(
        detail.focalPoint.dx - _offset.dx,
        detail.focalPoint.dy - _offset.dy,
        1,
      ).multiplied(recodeMatrix);
    } else {
      if ((detail.rotation * 180 / pi).abs() > 15) {
        matrix.value =
            recodeMatrix.multiplied(Matrix4.rotationZ(detail.rotation));
      }
      if (detail.scale == 1.0) return;
      matrix.value = recodeMatrix
          .multiplied(Matrix4.diagonal3Values(detail.scale, detail.scale, 1));
    }
  }

  _onScaleEnd(ScaleEndDetails details) {
    recodeMatrix = matrix.value;
  }

  void _onScaleStart(ScaleStartDetails details) {
    if (details.pointerCount == 1) {
      _offset = details.focalPoint;
    }
  }
}
