import 'package:flutter/material.dart';

class CircleAnimation extends StatefulWidget {
  const CircleAnimation({Key? key}) : super(key: key);

  @override
  State<CircleAnimation> createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration animDuration = const Duration(milliseconds: 6000);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      value: .5,
      //初始值
      duration: animDuration,
      //正向时长
      reverseDuration: animDuration,
      //逆向时长
      lowerBound: 0,
      //下限
      upperBound: 1,
      //上限
      animationBehavior:
          AnimationBehavior.preserve, //动画禁用时AnimationController的行为
    )
      ..addListener(() {})
      //监听状态变化
      ..addStatusListener((status) {
        print(status);
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        //canceled可以监听动画器的取消
        _controller.stop(canceled: true);
      },
      onTap: () {
        ///平台是否禁用动画
        print(MediaQuery.of(context).disableAnimations);
        // _controller.reset();
        // _controller.forward();
        // _controller.reverse(from: 1);
        // _controller.repeat(
        //   min: 0,
        //   max: 1,
        //   reverse: true,
        //   period: Duration(seconds: 3),
        // );
        //弹簧
        // _controller.fling(
        //   velocity: 1,
        //   springDescription: SpringDescription.withDampingRatio(
        //     mass: 1, //质量
        //     stiffness: 1000, //刚度（越难形变）
        //     ratio: 3, //阻尼
        //   ),
        //   animationBehavior: AnimationBehavior.preserve,
        // );
        // 仿真驱动动画
        // _controller.fling();
        // _controller.animateWith(simulation)
        //animateTo&animateBack
        _controller.animateTo(
          1,
          duration: Duration(seconds: 3),
          curve: Curves.bounceIn,
        );
        _controller.animateBack(
          1,
          duration: Duration(seconds: 3),
          curve: Curves.linear,
        );
      },
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return Container(
              width: _controller.value * 200,
              height: _controller.value * 200,
              decoration: BoxDecoration(
                  color: Colors.lightBlue, shape: BoxShape.circle),
            );
          },
        ),
      ),
    );
  }
}

main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: CircleAnimation(),
    ),
  ));
}
