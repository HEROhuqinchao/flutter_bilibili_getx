import 'package:flutter/cupertino.dart';
import './particle.dart';

class ParticleManage extends ChangeNotifier {
  List<Particle> particles = [];
  late Size size;

  ParticleManage({required this.size});

  void addParticle(Particle particle) {
    particles.add(particle);
    notifyListeners();
  }

  void tick() {
    for (int i = 0; i < particles.length; i++) {
      doUpdate(particles[i]);
    }
    notifyListeners();
  }

  void doUpdate(Particle p) {
    p.vx += p.ax;
    p.vy += p.ay;
    p.x += p.vx;
    p.y += p.vy;
    if (p.x > size.width) {
      particles.remove(p);
    }
    if (p.x < 0) {
      p.x = 0;
      p.vx = -p.vx;
    }
    if (p.y > size.height) {
      particles.remove(p);
    }
    if (p.y < 0) {
      p.y = 0;
      p.vy = -p.vy;
    }
  }
}
