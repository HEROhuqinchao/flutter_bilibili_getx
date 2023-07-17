///将重要的文本在一长串文本中以一种颜色标出
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HYHighlightStrInText extends StatelessWidget {
  final String highlightText;
  final String originalText;
  final Color highlightColor;
  final Color originalColor;

  const HYHighlightStrInText(
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
              fontSize: 14.sp,
            ),
          ),
        );
      } else {
        textSpans.add(
          TextSpan(
            text: item,
            style: TextStyle(
              color: originalColor,
              fontSize: 14.sp,
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
