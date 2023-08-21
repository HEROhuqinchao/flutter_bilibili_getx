import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import './particle.dart';

class ParticleManage extends ChangeNotifier {
  List<Particle> particles = [];
  late Size size;
  late ui.Image image;

  ParticleManage({required this.size});

  set setImage(ui.Image image) {
    this.image = image;
  }

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
      p.x = size.width;
      p.vx = -p.vx;
    }
    if (p.x < 0) {
      p.x = 0;
      p.vx = -p.vx;
    }
    if (p.y > size.height) {
      p.y = 0;
    }
  }
}
