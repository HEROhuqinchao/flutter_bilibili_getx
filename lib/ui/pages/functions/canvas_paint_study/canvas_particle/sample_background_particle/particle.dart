import 'dart:ui';

import 'package:flutter/material.dart';

class Particle {
  double x;
  double y;
  double vx;
  double ax;
  double ay;
  double vy;
  double size;
  Color color;

  Particle({
    this.x = 0,
    this.y = 0,
    this.vx = 0,
    this.ax = 0,
    this.ay = 0,
    this.vy = 0,
    this.size = 0,
    this.color = Colors.black,
  });

  factory Particle.copyWith(Particle p) => Particle(
        x: p.x,
        y: p.y,
        vx: -p.vx,
        ax: p.ax,
        ay: p.ay,
        vy: -p.vy,
        size: p.size / 2,
        color: p.color,
      );
}
