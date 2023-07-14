import 'package:bilibili_getx/ui/widgets/preview_media/widget/preview_media_pageview_child.dart';
import 'package:flutter/material.dart';

class PreviewMediaWidget extends StatefulWidget {
  final List<String> mediaList;

  const PreviewMediaWidget(this.mediaList, {super.key});

  @override
  State<PreviewMediaWidget> createState() => _PreviewMediaWidgetState();
}

class _PreviewMediaWidgetState extends State<PreviewMediaWidget> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: widget.mediaList.length,
      itemBuilder: (ctx, index) {
        return PreviewMediaPageViewChild(
          url: widget.mediaList[index],
        );
      },
    );
  }
}
