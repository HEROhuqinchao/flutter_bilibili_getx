import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RankNo extends StatelessWidget {
  final Color color;
  final String text;

  const RankNo({Key? key, required this.color, required this.text})
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
      width: 30.w,
      height: 23.h,
      //背景装饰
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(3.r)),
        //线性渐变
        gradient: LinearGradient(
          //渐变使用到的颜色
          colors: [color, Colors.white],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Text(
        "$text  ",
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontFamily: 'bilibiliFonts',
          color: Colors.white,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // double roundnessFactor = size.height * 0.33;
    Path path = Path();

    path.moveTo(size.width * 0.40, size.height);
    path.quadraticBezierTo(
        size.width * 0.40, size.height, size.width * 0.50, size.width);
    path.quadraticBezierTo(size.width * 0.50, size.height, size.width, 0);
    path.lineTo(size.width * 0.05, 0);
    path.quadraticBezierTo(size.width * 0.05, 0, 0, size.height * 0.05);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.40, size.height);

    // //移动到A点
    // path.moveTo(0, size.height * 0.33);
    // //画直线到B点 同时也充当 下一个二阶贝塞尔曲线 的起点
    // path.lineTo(0, size.height - roundnessFactor);
    //
    // //二阶贝塞尔曲线 只有一个控制点
    // // 控制点 C (0, size.height)
    // // 终点 D (roundnessFactor, size.height)
    // path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    //
    //
    // //二阶贝塞尔曲线 只有一个控制点
    // //画直线到 E点 同时也充当 二阶贝塞尔曲线 的起点
    // path.lineTo(size.width - roundnessFactor, size.height);
    // // 控制点 F (size.width, size.height)
    // // 终点 G (size.width, size.height - roundnessFactor)
    // path.quadraticBezierTo(
    //     size.width, size.height, size.width, size.height - roundnessFactor);
    //
    // //二阶贝塞尔曲线 只有一个控制点
    // //画直线到 H 点 同时也充当 二阶贝塞尔曲线 的起点
    // path.lineTo(size.width, roundnessFactor * 2);
    // // 控制点 M 与 终点 K
    // path.quadraticBezierTo(size.width - 10, roundnessFactor,
    //     size.width - roundnessFactor * 1.5, roundnessFactor * 1.5);
    //
    // //二阶贝塞尔曲线 只有一个控制点
    // //画直线到 T点 同时也充当 二阶贝塞尔曲线 的起点
    // path.lineTo(
    //     roundnessFactor * 0.6, size.height * 0.33 - roundnessFactor * 0.3);
    // //控制点 W Z
    // path.quadraticBezierTo(
    //     0, size.height * 0.33, 0, size.height * 0.33 + roundnessFactor);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
