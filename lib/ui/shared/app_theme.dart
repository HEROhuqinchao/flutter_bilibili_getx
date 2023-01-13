import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/shared_util.dart';

class HYAppTheme {
  ///字体大小、颜色-共有属性
  // static double xxxSmallFontSize = 10.sp;
  // static double xxSmallFontSize = 12.sp;
  // static double xSmallFontSize = 14.sp;
  // static double smallFontSize = 16.sp;
  // static double commonFontSize = 18.sp;
  // static double normalFontSize = 20.sp;
  // static double largeFontSize = 22.sp;
  // static double xLargeFontSize = 24.sp;
  // static double xxLargeFontSize = 26.sp;
  // static double xxxLargeFontSize = 28.sp;
  // static double hugeFontSize = 32.sp;
  // static double xHugeFontSize = 34.sp;
  // static double xxHugeFontSize = 36.sp;
  // static double xxxHugeFontSize = 38.sp;

  ///普通模式
  ///白色
  static const Color norTextColors = Colors.black;
  static const Color norWhite01Color = Colors.white;
  static const Color norWhite02Color = Color.fromRGBO(246, 247, 249, 1);
  static const Color norWhite03Color = Color.fromRGBO(255, 236, 240, 1);
  static const Color norWhite04Color = Color.fromRGBO(242, 243, 245, 1);
  static const Color norWhite05Color = Color.fromRGBO(254, 244, 234, 1);
  static const Color norWhite06Color = Color.fromRGBO(241, 242, 244, 1);
  static const Color norWhite07Color = Color.fromRGBO(245, 247, 250, 1);
  static const Color norWhite08Color = Color.fromRGBO(246, 247, 249, 1);

  ///灰色
  static const Color norGrayColor = Color.fromRGBO(149, 149, 149, 1);
  static const Color norGray02Color = Color.fromRGBO(100, 101, 103, 1);
  static const Color norGray03Color = Color.fromRGBO(95, 103, 106, 1);
  static const Color norGray04Color = Color.fromRGBO(77, 77, 77, 1);
  static const Color norGray05Color = Color.fromRGBO(156, 156, 158, 1);
  static const Color unselectedLabelColor = Color.fromRGBO(95, 95, 95, 1);

  ///粉色（主题色）
  static const Color norMainThemeColors = Color.fromRGBO(253, 105, 155, 1);
  static const Color norPink02Colors = Color.fromRGBO(255, 154, 184, 1);
  static const Color norPink03Colors = Color.fromRGBO(133, 61, 83, 1);
  static const Color norPink04Colors = Color.fromRGBO(255, 102, 156, 1);
  static const Color norPink05Colors = Color.fromRGBO(177, 143, 157, 1);
  static const Color norPink06Colors = Color.fromRGBO(236, 114, 153, 1);
  static const Color norPink07Colors = Color.fromRGBO(226, 134, 159, 1);
  static const Color norPink08Colors = Color.fromRGBO(217, 121, 151, 1);

  ///蓝色
  static const Color norBlue01Colors = Color.fromRGBO(44, 158, 221, 1);
  static const Color norBlue02Colors = Color.fromRGBO(24, 114, 164, 1);
  static const Color norBlue03Colors = Color.fromRGBO(51, 62, 84, 1);
  static const Color norBlue04Colors = Color.fromRGBO(92, 154, 231, 1);
  static const Color norBlue05Colors = Color.fromRGBO(36, 52, 168, 1);

  ///黄色
  static const Color norYellow01Colors = Color.fromRGBO(245, 185, 37, 1);
  static const Color norYellow02Colors = Color.fromRGBO(245, 176, 56, 1);
  static const Color norYellow03Colors = Color.fromRGBO(234, 154, 93, 1);
  static const Color norYellow04Colors = Color.fromRGBO(215, 100, 30, 1);
  static const Color norYellow05Colors = Color.fromRGBO(114, 89, 27, 1);

  ///阴影
  static BoxShadow norBoxShadow = BoxShadow(
    color: HYAppTheme.norTextColors.withOpacity(.1),
    blurRadius: 3,
    spreadRadius: 1,
    offset: const Offset(0, 0),
  );

  ///渐变黑色区域（凸显白色的字）


  ///默认下的主题
  static final ThemeData norTheme = ThemeData(
    primaryColor: norWhite01Color,
    primarySwatch: createMaterialColor(norMainThemeColors),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: norMainThemeColors,
        selectionColor: norBlue01Colors.withOpacity(.5)),
    canvasColor: norWhite06Color,
    fontFamily: 'bilibiliFonts',
  );

  ///暗黑模式
// static const Color darkTextColors = Colors.green;
// static final ThemeData darkTheme = ThemeData(
//   primarySwatch: createMaterialColor(Color.fromRGBO(24, 25, 27, 1)),
//   canvasColor: Color.fromRGBO(0, 0, 0, 1),
//   textTheme: TextTheme(
// bodySmall: TextStyle(fontSize: xSmallFontSize),
// displaySmall: TextStyle(fontSize: smallFontSize),
// displayMedium: TextStyle(fontSize: normalFontSize),
// displayLarge: TextStyle(fontSize: largeFontSize),
// ),
// );
}
