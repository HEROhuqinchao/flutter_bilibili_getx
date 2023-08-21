import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RawGestureDetectorDemo extends StatefulWidget {
  const RawGestureDetectorDemo({super.key});

  @override
  State<RawGestureDetectorDemo> createState() => _RawGestureDetectorDemoState();
}

class _RawGestureDetectorDemoState extends State<RawGestureDetectorDemo> {
  String action = '';
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        TapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
          () => TapGestureRecognizer(),
          (instance) {
            instance
              ..onTapDown = _tapDown
              ..onTapUp = _tapUp
              ..onTap = _tap
              ..onTapCancel = _tapCancel;
          },
        ),
        DoubleTapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<DoubleTapGestureRecognizer>(
          () => DoubleTapGestureRecognizer(),
          (instance) {
            instance
              ..onDoubleTap = _doubleTap
              ..onDoubleTapDown = _doubleTapDown
              ..onDoubleTapCancel = _doubleTapCancel;
          },
        ),
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        color: color,
        alignment: Alignment.center,
        child: Text(
          "action:$action",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    setState(() {
      action = 'down';
      color = Colors.blue;
    });
  }

  void _tapUp(TapUpDetails details) {
    setState(() {
      action = 'up';
      color = Colors.purple;
    });
  }

  void _tap() {
    setState(() {
      action = 'tap';
    });
  }

  void _tapCancel() {
    setState(() {
      action = 'cancel';
      color = Colors.orange;
    });
  }

  void _doubleTap() {}

  void _doubleTapCancel() {}

  void _doubleTapDown(TapDownDetails details) {}
}
