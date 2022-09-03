import 'package:flutter/material.dart';

import 'height_reporter.dart';

//参考https://www.jianshu.com/p/a55184ee0d24
class ExpandedWidget extends StatefulWidget {
  Widget child;
  double defaultHeight;
  Key key;

  ExpandedWidget(
      {required this.child, required this.defaultHeight, required this.key});

  @override
  State<ExpandedWidget> createState() => ExpandedWidgetState();
}

class ExpandedWidgetState extends State<ExpandedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> curve;
  late Animation<double> videoDetailsHeightAnimation;
  late ScrollController scrollController;
  late double realHeight = 0;
  late HeightReporter heightReporter;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    curve = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    videoDetailsHeightAnimation =
        Tween(begin: 0.0, end: realHeight).animate(controller);
    scrollController = ScrollController();
    heightReporter = HeightReporter(
      child: widget.child,
    );
    super.initState();
  }

  widgetShift() {
    // print('heightReporter.getHeight()----${heightReporter.getHeight()}');
    realHeight = heightReporter.getHeight() ?? 0;
    videoDetailsHeightAnimation =
        Tween(begin: 0.0, end: realHeight).animate(controller)
          ..addListener(() {
            setState(() {});
          });
    videoDetailsHeightAnimation.value == widget.defaultHeight
        ? controller.forward()
        : controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: videoDetailsHeightAnimation.value,

      ///在SingleChildScrollView里面外层的组件设置了高度，SingleChildScrollView也可以获取到你想要的组件的高度
      ///不嵌套SingleChildScrollView，只会获得零高度
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        controller: scrollController,
        child: heightReporter,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
