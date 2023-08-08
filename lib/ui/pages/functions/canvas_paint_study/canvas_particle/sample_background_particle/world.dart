import 'dart:async';
import 'dart:math';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './particle.dart';
import './particle_manage.dart';

class World extends StatefulWidget {
  const World({super.key});

  @override
  State<World> createState() => _WorldState();
}

class _WorldState extends State<World> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  ParticleManage pm = ParticleManage(size: const Size(300, 300));
  Random random = Random();
  late Timer timer;

  @override
  void initState() {
    initParticleManage();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..addListener(pm.tick)
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future loadImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    pm.setImage = await decodeImageFromList(data.buffer.asUint8List());
  }

  initParticleManage() async {
    await loadImageFromAssets(ImageAssets.rainPng);
    for (int i = 0; i < 60; i++) {
      Particle particle = Particle(
        x: pm.size.width / 60 * i,
        y: 0,
        vx: 1 * random.nextDouble() * pow(-1, random.nextInt(20)),
        vy: 4 * random.nextDouble() + 1,
        size: 5,
      );
      pm.particles.add(particle);
    }
  }

  Color randomRGB({int limitR = 0, int limitG = 0, int limitB = 0}) {
    var r = limitR + random.nextInt(256 - limitR);
    var g = limitR + random.nextInt(256 - limitG);
    var b = limitR + random.nextInt(256 - limitB);
    return Color.fromARGB(255, r, g, b);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: theWorld,
      child: CustomPaint(
        size: pm.size,
        painter: WorldRender(manage: pm),
      ),
    );
  }

  void theWorld() {
    if (_controller.isAnimating) {
      _controller.stop();
    } else {
      _controller.repeat();
    }
  }
}

class WorldRender extends CustomPainter {
  final ParticleManage manage;
  Paint fillPaint = Paint();
  Paint strokePaint = Paint()
    ..strokeWidth = .5
    ..style = PaintingStyle.stroke;
  Paint directionPaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = Colors.red
    ..strokeWidth = 2;

  WorldRender({required this.manage}) : super(repaint: manage);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, strokePaint);
    for (var particle in manage.particles) {
      drawParticle(canvas, particle);
    }
  }

  void drawParticle(Canvas canvas, Particle particle) {
    fillPaint.color = particle.color;
    canvas.save();
    canvas.translate(particle.x, particle.y);
    var dis = sqrt(particle.vy * particle.vy + particle.vx * particle.vx);
    canvas.rotate(acos(particle.vx / dis) + pi + pi / 2);
    // canvas.drawLine(Offset(0, 0), Offset(0, 10), fillPaint);
    canvas.drawImageRect(
      manage.image,
      Rect.fromLTWH(0, 0, manage.image.width * 1.0, manage.image.height * 1.0),
      Rect.fromLTWH(
          0, 0, manage.image.width * 0.18, manage.image.height * 0.18),
      fillPaint,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant WorldRender oldDelegate) =>
      oldDelegate.manage != manage;
}
