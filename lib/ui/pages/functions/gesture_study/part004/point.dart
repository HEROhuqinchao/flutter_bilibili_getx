import 'dart:math';
import 'dart:ui';

///点类
class Point {
  final double x;
  final double y;

  Point({
    required this.x,
    required this.y,
  });

  factory Point.fromOffset(Offset offset) {
    return Point(x: offset.dx, y: offset.dy);
  }

  double get distance => sqrt(x * x + y * y);

  Point operator -(Point other) => Point(x: x - other.x, y: y - other.y);

  Offset toOffset() => Offset(x, y);
}