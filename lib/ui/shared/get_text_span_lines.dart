import 'package:flutter/cupertino.dart';

Widget buildTextLineTest(
    {required String text,
    required TextStyle textStyle,
    required double maxWidth,
    required int maxLines}) {
  return LayoutBuilder(
    builder: (ctx, con) {
      final span = TextSpan(
        text: text,
        style: textStyle,
      );
      final tp = TextPainter(
        text: span,
        textDirection: TextDirection.ltr,
      );
      tp.layout(maxWidth: maxWidth);
      final numLines = tp.computeLineMetrics().length;
      if (numLines > maxLines) {
        print("行数超过3");
        return Text(text, style: textStyle);
      } else {
        print("行数没超过3");
        return Text(text, style: textStyle);
      }
    },
  );
}
