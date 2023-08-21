import 'dart:ui';

import 'package:flutter/cupertino.dart';

///变化数值类
class TransformValue {
  ///初始
  double scaleBefore;
  double rotationBefore;
  Offset offsetBefore;

  ///转变后
  double scale;
  double rotation;
  Offset offset;

  TransformValue({
    required this.scaleBefore,
    required this.rotationBefore,
    required this.offsetBefore,
    required this.scale,
    required this.rotation,
    required this.offset,
  });

  ///获取变形前的矩阵
  Matrix4 get formBeforeMatrix4 => Matrix4.identity()
    ..translate(offsetBefore.dx, offsetBefore.dy)
    ..scale(scaleBefore)
    ..rotateZ(rotationBefore);

  ///获取变形后的矩阵
  Matrix4 get formMatrix4 => Matrix4.identity()
    ..translate(offset.dx, offset.dy)
    ..scale(scale)
    ..rotateZ(rotation);
}
