import 'dart:math';

import 'package:flutter/material.dart';

class BurstMenu extends StatefulWidget {
  final List<Widget> menus;
  final Widget center;
  final double swapAngle = 120;
  final double startAngle = 50;

  BurstMenu({
    required this.menus,
    required this.center,
  });

  @override
  State<BurstMenu> createState() => _BurstMenuState();
}

class _BurstMenuState extends State<BurstMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      value: 0,
      duration: const Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: _CircleFlowDelegate(
        animation: animationController,
        swapAngle: widget.swapAngle,
        startAngle: widget.startAngle,
      ),
      children: [
        ...widget.menus,
        GestureDetector(
          onTap: () {
            if (animationController.isCompleted) {
              animationController.reverse();
            } else {
              animationController.forward();
            }
          },
          child: widget.center,
        ),
      ],
    );
  }
}

class _CircleFlowDelegate extends FlowDelegate {
  late Animation<double> animation;
  late double swapAngle;
  late double startAngle;

  _CircleFlowDelegate({
    required this.animation,
    required this.swapAngle,
    required this.startAngle,
  }) : super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    double radius = context.size.shortestSide / 2;
    final int count = context.childCount - 1;
    final double perRad = swapAngle / 180 * pi / (count - 1);
    for (int i = 0; i < count; i++) {
      final double cSizeX = context.getChildSize(i)!.width / 2;
      final double cSizeY = context.getChildSize(i)!.height / 2;
      final double offsetX = animation.value *
              (radius - cSizeX) *
              cos(i * perRad - startAngle / 180 * pi) +
          radius;
      final double offsetY = animation.value *
              (radius - cSizeY) *
              sin(i * perRad - startAngle / 180 * pi) +
          radius;

      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          offsetX - cSizeX,
          offsetY - cSizeY,
          0.0,
        ),
        opacity: animation.value,
      );
    }
    context.paintChild(
      context.childCount - 1,
      transform: Matrix4.translationValues(
        radius - context.getChildSize(context.childCount - 1)!.width / 2,
        radius - context.getChildSize(context.childCount - 1)!.height / 2,
        0.0,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return false;
  }
}

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            child: BurstMenu(
              menus: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
              center: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
