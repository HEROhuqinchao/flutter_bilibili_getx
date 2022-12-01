import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/model/web/dynamic/web_dynamic_v1_feed_all.dart';
import '../shared/app_theme.dart';
import '../shared/image_asset.dart';
import 'fade_image_default.dart';

/// 参考 https://juejin.cn/post/7028151999019352072
class CommonRichText extends StatefulWidget {
  ///文本内容长度限制
  final String text;

  ///完整富文本内容
  final List<InlineSpan> richText;
  final List<PurpleRichTextNode> richTextNodes;
  final int maxLines;
  final int minLines;
  final TextStyle? textStyle;
  final String shrinkText;
  final String expandText;
  final Function? onShrink;
  final Function? onExpand;

  const CommonRichText({
    super.key,
    this.text = '',
    required this.richText,
    required this.richTextNodes,
    this.maxLines = 4,
    this.minLines = 1,
    this.textStyle,
    this.shrinkText = '\n展开',
    this.expandText = '\n收起',
    this.onShrink,
    this.onExpand,
  });

  _RichTextState createState() => _RichTextState();
}

class _RichTextState extends State<CommonRichText> {
  bool _isExpand = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CommonRichText oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      TextPainter textPainter = TextPainter(
        maxLines: widget.maxLines,
        locale: Localizations.localeOf(context),
        textAlign: TextAlign.start,
        text: TextSpan(
          text: widget.text,
          style: widget.textStyle,
        ),
        textDirection: TextDirection.ltr,
      )..layout(minWidth: constraints.minWidth, maxWidth: constraints.maxWidth);

      /// 判断是否已经超过最大行数
      if (textPainter.didExceedMaxLines) {
        final textSize = textPainter.size;
        final position = textPainter.getPositionForOffset(Offset(
          textSize.width - textPainter.width,
          textSize.height,
        ));

        ///展开收缩按钮在某些情况下会换行，展字在上一行，开字在下一行
        final endOffset = textPainter.getOffsetBefore(position.offset - 1);
        return RichText(
          overflow: TextOverflow.clip,
          text: TextSpan(
            /// 截取 0-endOffset 的字符串，再在后面拼接展开/收起
            // text: !_isExpand ? "" : widget.text.substring(0, endOffset!),
            style: widget.textStyle,
            children: [
              ...!_isExpand ? [] : buildHeaderRichText(endOffset!),
              ..._isExpand ? [] : widget.richText,
              TextSpan(
                text: _isExpand ? widget.shrinkText : widget.expandText,
                style: TextStyle(
                  color: HYAppTheme.norBlue01Colors,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'bilibiliFonts',
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(
                      () {
                        /// 点击实现展开/收起的切换
                        _isExpand = !_isExpand;
                      },
                    );
                  },
              ),
            ],
          ),
        );
      } else {
        return Text.rich(
            TextSpan(children: [...widget.richText], style: widget.textStyle));
      }
    });
  }

  List<InlineSpan> buildHeaderRichText(int endOffset) {
    int number = 0;
    List<InlineSpan> children = [];
    for (var item in widget.richTextNodes) {
      number += item.origText.length;
      if (number > endOffset) {
        if (item.type == "RICH_TEXT_NODE_TYPE_TEXT") {
          int tempNumber = (number - item.origText.length);
          String text = item.origText.substring(0, endOffset - tempNumber);
          children.add(TextSpan(text: text));
        }
        break;
      } else {
        InlineSpan child;
        if (item.type == "RICH_TEXT_NODE_TYPE_TEXT") {
          child = TextSpan(
            text: item.text,
            style: TextStyle(
                height: 1.5,
                color: HYAppTheme.norTextColors,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                fontFamily: 'bilibiliFonts'),
          );
          children.add(child);
        } else if (item.type == "RICH_TEXT_NODE_TYPE_TOPIC") {
          final Widget svg = SvgPicture.asset(
            ImageAssets.topicSVG,
            semanticsLabel: 'topic svg',
            width: 10.r,
            height: 10.r,
          );
          children.add(WidgetSpan(child: svg));
          child = TextSpan(
            text: item.text,
            style: TextStyle(
                height: 1.5,
                color: HYAppTheme.norBlue01Colors,
                fontSize: 13.sp,
                fontWeight: FontWeight.normal,
                fontFamily: 'bilibiliFonts'),
          );
          children.add(child);
        } else if (item.type == "RICH_TEXT_NODE_TYPE_EMOJI") {
          child = WidgetSpan(
            child: DefaultFadeImage(
              width: 23.r,
              height: 23.r,
              imageUrl: item.emoji!.iconUrl,
              fit: BoxFit.cover,
            ),
          );
          children.add(child);
        } else if (item.type == "RICH_TEXT_NODE_TYPE_GOODS") {
          child = TextSpan(
            text: item.text,
            style: TextStyle(
                height: 1.5,
                color: HYAppTheme.norTextColors,
                fontSize: 13.sp,
                fontWeight: FontWeight.normal,
                fontFamily: 'bilibiliFonts'),
          );
          children.add(child);
        } else {
          print("位置类型");
        }
      }
    }
    return children;
  }
}
