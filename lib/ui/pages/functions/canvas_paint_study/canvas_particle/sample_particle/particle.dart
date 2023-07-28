import 'dart:ui';

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
    required this.x,
    required this.y,
    required this.vx,
    required this.ax,
    required this.ay,
    required this.vy,
    required this.size,
    required this.color,
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
