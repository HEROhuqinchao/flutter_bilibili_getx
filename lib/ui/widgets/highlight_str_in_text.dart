///将重要的文本在一长串文本中以一种颜色标出
import "package:flutter/material.dart";

import '../shared/app_theme.dart';

class HYHighlightStrInText extends StatelessWidget {
  String highlightText;
  String originalText;
  Color highlightColor;
  Color originalColor;

  HYHighlightStrInText(
      {Key? key,
      required this.highlightText,
      required this.originalText,
      required this.highlightColor,
      required this.originalColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> originalTextList = originalText.split('');
    List<InlineSpan> textSpans = [];
    for (var item in originalTextList) {
      if (highlightText.contains(item) == true) {
        textSpans.add(
          TextSpan(
            text: item,
            style: TextStyle(
              color: highlightColor,
              fontSize: HYAppTheme.xSmallFontSize,
            ),
          ),
        );
      } else {
        textSpans.add(
          TextSpan(
            text: item,
            style: TextStyle(
              color: originalColor,
              fontSize: HYAppTheme.xSmallFontSize,
            ),
          ),
        );
      }
    }
    return Text.rich(
      TextSpan(
        children: textSpans,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
