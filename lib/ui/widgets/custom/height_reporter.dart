import 'package:flutter/material.dart';

///获取高度
class HeightReporter extends StatelessWidget {
  final Widget child;
  late final double _height;

  HeightReporter({super.key, required this.child}) {
    _height = 0;
  }

  double? getHeight() {
    return _height;
  }

  set setHeight(double value) => _height = value;

  @override
  Widget build(BuildContext context) {
    Widget tmp = GestureDetector(
      child: child,
      onTap: () {
        print('Height is ${context.size?.height}');
      },
    );

    Future.delayed(const Duration(milliseconds: 200)).then((e) {
      setHeight = context.size!.height;
      // debugPrint('Height is ${context.size?.height}');
    });

    return tmp;
  }
}
