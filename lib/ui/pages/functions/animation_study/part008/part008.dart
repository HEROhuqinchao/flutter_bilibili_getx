import 'dart:math';

import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';

class ToggleRotate extends StatefulWidget {
  final ImageProvider imageProvider;
  final double radius;
  final Duration duration;
  final double initRadius;

  const ToggleRotate({
    super.key,
    required this.imageProvider,
    required this.radius,
    required this.duration,
    required this.initRadius,
  });

  @override
  State<ToggleRotate> createState() => _ToggleRotateState();
}

class _ToggleRotateState extends State<ToggleRotate>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: widget.initRadius,
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.decelerate,
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ToggleRotate oldWidget) {
    if (oldWidget.initRadius != widget.initRadius) {
      animationController.dispose();
      animationController = AnimationController(
        vsync: this,
        value: widget.initRadius,
        duration: widget.duration,
      );
      animation = CurvedAnimation(
        parent: animationController,
        curve: Curves.decelerate,
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        animationController.forward();
      },
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(
              widget.radius * animation.value,
            ),
            child: Image(
              width: 100,
              height: 100,
              image: widget.imageProvider,
            ),
          );
        },
      ),
    );
  }
}

class Part008 extends StatefulWidget {
  const Part008({Key? key}) : super(key: key);

  @override
  State<Part008> createState() => _Part008State();
}

class _Part008State extends State<Part008> {
  late ValueNotifier<double> valueNotifier = ValueNotifier(0);

  @override
  void initState() {
    valueNotifier = ValueNotifier(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder<double>(
          valueListenable: valueNotifier,
          builder: (ctx, value, widget) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Slider(
                  max: 1,
                  min: 0,
                  value: value,
                  onChanged: (value) {
                    valueNotifier.value = value;
                  },
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: ToggleRotate(
                    initRadius: value,
                    imageProvider: AssetImage(
                      ImageAssets.arPNG,
                    ),
                    radius: 60 / 180 * pi,
                    duration: Duration(seconds: 1),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

main() {
  runApp(
    MaterialApp(
      home: Part008(),
    ),
  );
}
