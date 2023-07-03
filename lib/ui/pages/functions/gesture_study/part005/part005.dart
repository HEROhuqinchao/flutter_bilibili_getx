import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gesture_painter.dart';

main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<Matrix4> matrix =
      ValueNotifier<Matrix4>(Matrix4.identity());
  Matrix4 recodeMatrix = Matrix4.identity();

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
    if (detail.scale == 1.0) return;
    matrix.value = recodeMatrix
        .multiplied(Matrix4.diagonal3Values(detail.scale, detail.scale, 1));
  }

  _onScaleEnd(ScaleEndDetails details) {
    recodeMatrix = matrix.value;
  }
}
