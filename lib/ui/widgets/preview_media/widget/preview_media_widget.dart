import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/widgets/preview_media/widget/preview_media_pageview_child.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviewMediaWidget extends StatefulWidget {
  final List<String> mediaList;

  const PreviewMediaWidget(this.mediaList, {super.key});

  @override
  State<PreviewMediaWidget> createState() => _PreviewMediaWidgetState();
}

class _PreviewMediaWidgetState extends State<PreviewMediaWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: PageView.builder(
        itemCount: widget.mediaList.length,
        itemBuilder: (ctx, index) {
          return PreviewMediaPageViewChild(
            url: widget.mediaList[index],
          );
        },
      ),
    );
  }
}
