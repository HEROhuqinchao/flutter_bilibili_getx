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
      body: Center(child: AnimatedPaddingExample()),
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

class AnimatedDefaultTextStyleExample extends StatefulWidget {
  const AnimatedDefaultTextStyleExample({super.key});

  @override
  State<AnimatedDefaultTextStyleExample> createState() =>
      _AnimatedDefaultTextStyleExampleState();
}

class _AnimatedDefaultTextStyleExampleState
    extends State<AnimatedDefaultTextStyleExample>
    with SingleTickerProviderStateMixin {
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
        AnimatedDefaultTextStyle(
          child: Text("你好"),
          style: switchValue
              ? TextStyle(
                  color: HYAppTheme.norBlackColors,
                  fontSize: 20,
                )
              : TextStyle(
                  fontSize: 60,
                  color: HYAppTheme.norBlue01Colors,
                ),
          duration: Duration(seconds: 1),
        ),
      ],
    );
  }
}

///AnimatedAlign
class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Switch(
          value: switchValue,
          onChanged: (value) {
            switchValue = !switchValue;
            setState(() {});
          },
        ),
        Container(
          color: HYAppTheme.norMainThemeColors,
          width: 100,
          height: 100,
          child: AnimatedAlign(
            alignment: switchValue ? Alignment.bottomLeft : Alignment.topRight,
            duration: Duration(seconds: 1),
            child: Text("你好"),
          ),
        ),
      ],
    );
  }
}

///AnimatedContainer
class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Switch(
          value: switchValue,
          onChanged: (value) {
            switchValue = !switchValue;
            setState(() {});
          },
        ),
        AnimatedContainer(
          decoration: switchValue
              ? BoxDecoration(
                  color: HYAppTheme.norMainThemeColors,
                  borderRadius: BorderRadius.all(Radius.circular(10)))
              : BoxDecoration(
                  color: HYAppTheme.norBlue01Colors,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
          duration: Duration(seconds: 1),
          child: Container(
            width: 100,
            height: 100,
          ),
        ),
      ],
    );
  }
}

///TweenAnimationBuilder
class TweenAnimationBuilderExample extends StatefulWidget {
  const TweenAnimationBuilderExample({super.key});

  @override
  State<TweenAnimationBuilderExample> createState() =>
      _TweenAnimationBuilderExampleState();
}

class _TweenAnimationBuilderExampleState
    extends State<TweenAnimationBuilderExample> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Switch(
          value: switchValue,
          onChanged: (value) {
            switchValue = !switchValue;
            setState(() {});
          },
        ),
        TweenAnimationBuilder(
          tween: ColorTween(
              begin: Colors.red, end: switchValue ? Colors.blue : Colors.green),
          duration: Duration(seconds: 1),
          builder: (ctx, color, child) {
            return Container(
              color: color as Color,
              width: 100,
              height: 100,
            );
          },
        )
      ],
    );
  }
}

///AnimatedPadding
class AnimatedPaddingExample extends StatefulWidget {
  const AnimatedPaddingExample({super.key});

  @override
  State<AnimatedPaddingExample> createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
  final EdgeInsets beginOpacity = EdgeInsets.all(10);
  final EdgeInsets endPadding = EdgeInsets.all(30);
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Switch(
          value: switchValue,
          onChanged: (value) {
            switchValue = !switchValue;
            setState(() {});
          },
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.blue,
          child: AnimatedPadding(
            padding: switchValue ? beginOpacity : endPadding,
            duration: Duration(seconds: 1),
            child: Text("你好"),
          ),
        ),
      ],
    );
  }
}
