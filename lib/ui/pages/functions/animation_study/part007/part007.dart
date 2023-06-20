import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';

class CircleShineImage extends StatefulWidget {
  late double maxBlurRadius;
  late Color color;
  late Duration duration;
  late Curve curve;
  late ImageProvider imageProvider;
  late double radius;

  CircleShineImage({
    required this.maxBlurRadius,
    required this.color,
    required this.duration,
    required this.curve,
    required this.imageProvider,
    required this.radius,
  });

  @override
  State<CircleShineImage> createState() => _CircleShineImageState();
}

class _CircleShineImageState extends State<CircleShineImage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      value: 0.5,
      duration: widget.duration,
    );
    animation = Tween(begin: 0.4, end: 0.8).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.radius * 2,
      width: widget.radius * 2,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: widget.imageProvider,
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: widget.color,
            blurRadius: animation.value * widget.maxBlurRadius,
            spreadRadius: 3,
          )
        ],
      ),
    );
  }
}

class Part007 extends StatefulWidget {
  const Part007({Key? key}) : super(key: key);

  @override
  State<Part007> createState() => _Part007State();
}

class _Part007State extends State<Part007> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleShineImage(
          maxBlurRadius: 6,
          color: Colors.blue,
          duration: Duration(seconds: 1),
          curve: Curves.linear,
          imageProvider: AssetImage(ImageAssets.arPNG),
          radius: 50,
        ),
      ),
    );
  }
}

main() {
  runApp(
    MaterialApp(
      home: Part007(),
    ),
  );
}
