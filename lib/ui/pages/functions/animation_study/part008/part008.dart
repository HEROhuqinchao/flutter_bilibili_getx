import 'dart:math';

import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';

class ToggleRotate extends StatefulWidget {
  late ImageProvider imageProvider;
  late double radius;
  late Duration duration;
  late double initRadius;

  ToggleRotate({
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
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: widget.initRadius,
    );
    animation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.decelerate,
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        animationController!.reset();
        animationController!.forward();
      },
      child: AnimatedBuilder(
        animation: animationController!,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(
              widget.radius * animation!.value + widget.initRadius / 180 * pi,
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

  @override
  void didUpdateWidget(ToggleRotate oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initRadius != widget.initRadius) {
      animationController!.dispose();
      animationController = AnimationController(
        vsync: this,
        duration: widget.duration,
        value: widget.initRadius,
      );
      animation = CurvedAnimation(
        parent: animationController!,
        curve: Curves.decelerate,
      );
    }

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
                  max: 180,
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
                    radius: 2 * pi,
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
