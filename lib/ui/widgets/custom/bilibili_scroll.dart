import 'package:flutter/material.dart';

///自定义侧边栏的滚动条样式
class BilibiliScroll extends StatefulWidget {
  ///滚动条
  final Widget scrollBar;

  ///被滚动的child
  final Widget child;

  const BilibiliScroll(
      {super.key, required this.scrollBar, required this.child});

  @override
  State<BilibiliScroll> createState() => _BilibiliScrollState();
}

class _BilibiliScrollState extends State<BilibiliScroll> {
  double _alignmentY = -1;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        ScrollMetrics metrics = notification.metrics;
        _alignmentY = -1 + (metrics.pixels / metrics.maxScrollExtent) * 2;
        setState(() {});
        return true;
      },
      child: Stack(
        children: [
          widget.child,
          Container(
            alignment: Alignment(1, _alignmentY),
            child: widget.scrollBar,
          )
        ],
      ),
    );
  }
}
