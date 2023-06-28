import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AnimatedOpacityExample()),
    );
  }
}

///RotationTransition
class RotationTransitionExample extends StatefulWidget {
  const RotationTransitionExample({Key? key}) : super(key: key);

  @override
  State<RotationTransitionExample> createState() =>
      _RotationTransitionExampleState();
}

class _RotationTransitionExampleState extends State<RotationTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animationController,
      child: Container(
        width: 100,
        height: 100,
        color: HYAppTheme.norMainThemeColors,
      ),
    );
  }
}

///AlignTransition
class AlignTransitionExample extends StatefulWidget {
  const AlignTransitionExample({Key? key}) : super(key: key);

  @override
  State<AlignTransitionExample> createState() => _AlignTransitionExampleState();
}

class _AlignTransitionExampleState extends State<AlignTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Alignment> animation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    Tween<Alignment> tween =
        Tween(begin: Alignment.bottomLeft, end: Alignment.topRight);
    animation = tween.animate(animationController);
    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlignTransition(
      alignment: animation,
      child: Container(
        width: 100,
        height: 100,
        color: HYAppTheme.norMainThemeColors,
      ),
    );
  }
}

///DecoratedBoxTransition
class DecoratedBoxTransitionExample extends StatefulWidget {
  const DecoratedBoxTransitionExample({Key? key}) : super(key: key);

  @override
  State<DecoratedBoxTransitionExample> createState() =>
      _DecoratedBoxTransitionExampleState();
}

class _DecoratedBoxTransitionExampleState
    extends State<DecoratedBoxTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Decoration> animation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    Tween<Decoration> tween = Tween(
        begin: BoxDecoration(color: HYAppTheme.norMainThemeColors),
        end: BoxDecoration(color: HYAppTheme.norBlue01Colors));
    animation = tween.animate(animationController);
    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBoxTransition(
        decoration: animation,
        child: Container(
          width: 100,
          height: 100,
        ));
  }
}

///AnimatedOpacity
class AnimatedOpacityExample extends StatefulWidget {
  const AnimatedOpacityExample({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityExample> createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Switch(
          value: switchValue,
          onChanged: (value) {
            switchValue = !switchValue;
            setState(() {});
          },
        ),
        AnimatedOpacity(
          opacity: switchValue ? 1 : 0,
          duration: Duration(
            seconds: 1,
          ),
          child: Container(
            width: 100,
            height: 100,
            color: HYAppTheme.norMainThemeColors,
          ),
        ),
      ],
    );
  }
}
