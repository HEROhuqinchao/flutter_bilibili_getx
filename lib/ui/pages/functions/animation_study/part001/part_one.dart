import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

final List<Color> colors = [
  Color(0xFFF60C0C),
  Color(0xFFF3B913),
  Color(0xFFE7F716),
  Color(0xFF3DF30B),
  Color(0xFF0DF6EF),
  Color(0xFF0829FB),
  Color(0xFFB709F4),
];
final List<double> pos = [
  1.0 / 7,
  2.0 / 7,
  3.0 / 7,
  4.0 / 7,
  5.0 / 7,
  6.0 / 7,
  1.0
];

main() {
  runApp(MaterialApp(
    home: TextBlur(),
  ));
}

///字体模糊
class TextBlur extends StatefulWidget {
  const TextBlur({Key? key}) : super(key: key);

  @override
  State<TextBlur> createState() => _TextBlurState();
}

class _TextBlurState extends State<TextBlur>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration animDuration = const Duration(milliseconds: 1000);

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: animDuration);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _controller.forward(from: 0);
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: _buildByAnim,
          // builder: _buildByAnim,
        ),
      ),
    );
  }

  Paint getPaint002() {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint.shader = ui.Gradient.linear(
      Offset(0, 0),
      Offset(100, 0),
      colors,
      pos,
      TileMode.mirror,
      Matrix4.rotationZ(pi / 6).storage,
    );
    paint.maskFilter =
        MaskFilter.blur(BlurStyle.solid, 15 * _controller.value); //模糊
    return paint;
  }

  Widget _buildByAnim(BuildContext context, Widget? child) {
    return Center(
      child: Text(
        "你好",
        style: TextStyle(
          fontSize: 60,
          foreground: getPaint002(),
        ),
      ),
    );
  }
}

///文字倾斜
class SkewShadowText extends StatefulWidget {
  @override
  State<SkewShadowText> createState() => _SkewShadowTextState();
}

class _SkewShadowTextState extends State<SkewShadowText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final TextStyle commonStyle = TextStyle(fontSize: 60, color: Colors.red);
  final TextStyle shadowStyle = TextStyle(fontSize: 60, color: Colors.blue);
  final String text = "阴影文字";
  final Duration animDuration = const Duration(milliseconds: 800);

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: animDuration);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _controller.forward(from: 0);
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (ctx, child) {
            return Stack(
              children: [
                Text(
                  text,
                  style: commonStyle,
                ),
                Transform(
                  transform: Matrix4.skewX(6 * _controller.value / 180 * pi),
                  child: Text(
                    text,
                    style: shadowStyle,
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

///打字机
class TextType extends StatefulWidget {
  const TextType({Key? key}) : super(key: key);

  @override
  State<TextType> createState() => _TextTypeState();
}

class _TextTypeState extends State<TextType> {
  final Duration animDuration = const Duration(milliseconds: 200);
  final String text = "12345678901234567890";

  ///作用类似于AnimationController，但不应该使用Animation，因为Animation数值变化的频率非常高
  final ValueNotifier<String> data = ValueNotifier<String>("");
  Timer? _timer;
  int currentIndex = 0;

  String get currentText => text.substring(0, currentIndex);

  @override
  void initState() {
    super.initState();
    _startAnim();
  }

  @override
  void dispose() {
    _timer!.cancel();
    data.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _startAnim,
          child: AnimatedBuilder(
            animation: data,
            builder: (_, __) => Text(
              data.value,
              style: TextStyle(color: Colors.blue, fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }

  void _startAnim() {
    _timer?.cancel();
    data.value = "";
    currentIndex = 0;
    _timer = Timer.periodic(animDuration, (timer) {
      if (currentIndex < text.length) {
        currentIndex++;
        data.value = currentText;
      } else {
        _timer!.cancel();
        _timer = null;
      }
    });
  }
}
