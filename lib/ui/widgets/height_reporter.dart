import 'package:flutter/material.dart';

class HeightReporter extends StatelessWidget {
  final Widget child;

  HeightReporter({required this.child});

  double? _height = 0;

  double? getHeight() {
    return _height;
  }

  @override
  Widget build(BuildContext context) {
    print("HeightReporterBuild");
    Widget tmp = GestureDetector(
      child: child,
      onTap: () {
        print('Height is ${context.size?.height}');
      },
    );

    Future.delayed(Duration(milliseconds: 200)).then((e) {
      _height = context.size?.height;
      // debugPrint('Height is ${context.size?.height}');
    });

    return tmp;
  }
}
