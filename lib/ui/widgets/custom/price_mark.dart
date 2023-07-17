import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceMark extends StatelessWidget {
  final Color color;
  final String text;

  const PriceMark({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipPath(
        //定义裁切路径
        clipper: BackgroundClipper(),
        child: buildContainer(context),
      ),
    );
  }

  //一个普通的背景
  Container buildContainer(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 40.w,
      height: 18.w,
      //背景装饰
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(2.r)),
        //线性渐变
        gradient: LinearGradient(
          //渐变使用到的颜色
          colors: [color, Colors.white],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Text.rich(TextSpan(children: [
        TextSpan(
          text: text,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: HYAppTheme.norTextColors,
            fontSize: 12.sp,
          ),
        )
      ])),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.5);
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(0, size.height * 0.5);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
