import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Particle {
  /// x 位移.
  double x;

  /// y 位移.
  double y;

  /// 粒子大小.
  double size;

  /// 粒子颜色.
  Color color;

  bool active; // 粒子是否可用

  double vx; /// 粒子水平速度.
  double ax; // 粒子水平加速度
  double ay; // 粒子竖直加速度
  double vy; ///粒子竖直速度.

  Particle({
    this.x = 0,
    this.y = 0,
    this.size = 0,
    this.vx=0,
    this.ax=0,
    this.ay=0,
    this.vy=0,
    this.active = true,
    this.color = Colors.black,
  });
}
