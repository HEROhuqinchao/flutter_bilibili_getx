import 'dart:async';
import 'dart:math';
import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/canvas_particle/sample_particle/particle_manage.dart';
import 'package:flutter/material.dart';
import './particle.dart';

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

  initParticleManage() async {
    // ByteData data = await rootBundle.load(ImageAssets.canvasAvatarPng);
    // Uint8List bytes =
    //     data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    // image.Image? imageSrc = image.decodeImage(bytes);
    // for (int i = 0; i < imageSrc!.width; i += 2) {
    //   for (int j = 0; j < imageSrc.height; j += 2) {
    //     image.Pixel pixel = imageSrc.getPixel(i, j);
    //     Particle particle = Particle(
    //       x: i * 1,
    //       y: j * 1,
    //       vx: 4 * random.nextDouble() * pow(-1, random.nextInt(20)),
    //       vy: 4 * random.nextDouble() * pow(-1, random.nextInt(20)),
    //       ay: .1,
    //       size: 2,
    //       color: Color.fromRGBO(
    //           pixel.r.toInt(), pixel.g.toInt(), pixel.b.toInt(), 1),
    //       ax: 0,
    //     );
    //     pm.particles.add(particle);
    //   }
    // }
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (pm.particles.length > 20) {
        timer.cancel();
      }
      pm.addParticle(Particle(
        x: 150,
        y: 100,
        vx: 4 * random.nextDouble() * pow(-1, random.nextInt(20)),
        ax: .1,
        ay: .1,
        vy: 4 * random.nextDouble() * pow(-1, random.nextInt(20)),
        // size: 5 + 4 * random.nextDouble(),
        size: 50,
        color: randomRGB(),
      ));
    });
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
    canvas.drawCircle(Offset(particle.x, particle.y), particle.size, fillPaint);
  }

  @override
  bool shouldRepaint(covariant WorldRender oldDelegate) =>
      oldDelegate.manage != manage;
}
