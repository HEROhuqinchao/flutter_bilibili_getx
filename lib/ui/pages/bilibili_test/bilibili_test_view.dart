import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'bilibili_test_logic.dart';

///只用于测试的界面!!!!
///到main.dart切换初始路由
class BilibiliTestScreen extends StatefulWidget {
  static String routeName = "/bilibili_test";

  @override
  State<BilibiliTestScreen> createState() => _BilibiliTestScreenState();
}

class _BilibiliTestScreenState extends State<BilibiliTestScreen>
    with SingleTickerProviderStateMixin {
  final logic = Get.find<BilibiliTestLogic>();
  final state = Get.find<BilibiliTestLogic>().state;
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> curve;
  late bool isFavor = false;

  @override
  void initState() {
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(animationController)
      ..addListener(() {
        if (animationController.value == animationController.upperBound) {
          isFavor = true;
          animationController.value = 0;
        }
        setState(() {});
      });
    super.initState();
  }

  List<InlineSpan> buildHeaderRichText(String text) {
    List<InlineSpan> children = [];
    text = "\r\n我喜欢在街上散步看看这个看看那个，这个样子被监控摄像头拍下来想想就很害羞…。";
    for (int i = 0; i < text.length; i++) {
      String str = text.substring(i, i + 1);
      TextSpan textSpan = TextSpan(text: str);
      children.add(textSpan);
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BilibiliTestLogic>(
      builder: (logic) {
        return Scaffold(
          backgroundColor: Colors.blueGrey,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    if (isFavor) {
                      isFavor = false;
                      setState(() {});
                    }
                  },
                  onLongPress: () {
                    animationController.forward();
                  },
                  onLongPressUp: () {
                    animationController.reverse();
                  },
                  child: !isFavor ? buildUnFavorButton() : buildFavoredButton(),
                ),
                Container(
                  width: 1.sw,
                  height: 200.w,
                  child: RichText(
                    text: TextSpan(children: buildHeaderRichText("")),
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              logic.createFloatingView(context);
            },
            child: Text("小窗"),
          ),
        );
      },
    );
  }

  // Widget buildTextLineTest() {
  // return TextLines(
  //   text: "早！早啊！早上好！おはよう☀[花丸晴琉_早安][花丸晴琉_早安]\n\n以前没有意识到的一个事情，现在在街上看发现周边都装上了监控摄像头！[花丸晴琉_啊咧][花丸晴琉_啊咧]\r\n虽然可以让人安心，但是数量多的惊人[花丸晴琉_惊慌]\r\n我喜欢在街上散步看看这个看看那个，这个样子被监控摄像头拍下来想想就很害羞…。[花丸晴琉_丧][花丸晴琉_无语] ",
  //   textStyle: TextStyle(
  //     color: Colors.black,
  //   ),
  //   maxWidth: 1.sw - 80.r,
  //   getLines: (lines) {
  //     print(lines);
  //   },
  // );

  // String yourText = "早！早啊！早上好！おはよう☀[花丸晴琉_早安][花丸晴琉_早安]\n\n以前没有意识到的一个事情，现在在街上看发现周边都装上了监控摄像头！[花丸晴琉_啊咧][花丸晴琉_啊咧]\r\n虽然可以让人安心，但是数量多的惊人[花丸晴琉_惊慌]\r\n我喜欢在街上散步看看这个看看那个，这个样子被监控摄像头拍下来想想就很害羞…。[花丸晴琉_丧][花丸晴琉_无语] ";
  // TextStyle yourStyle = TextStyle(color: Colors.black, height: 1.5);
  // return LayoutBuilder(
  //   builder: (ctx, con) {
  //     final span = TextSpan(
  //       text: yourText,
  //       style: yourStyle,
  //     );
  //     final tp = TextPainter(
  //       text: span,
  //       textDirection: TextDirection.ltr,
  //     );
  //     tp.layout(maxWidth: 1.sw - 80.r);
  //     final numLines = tp.computeLineMetrics().length;
  //     if (numLines > 3) {
  //       print("行数超过3");
  //       return Text(yourText, style: yourStyle);
  //     } else {
  //       print("行数没超过3");
  //       return Text(yourText, style: yourStyle);
  //     }
  //   },
  // );
  // }

  Widget buildFavoredButton() {
    return Container(
      width: 45.w,
      height: 45.w,
      child: Lottie.asset('assets/lottie/lottieLike.json', repeat: false),
    );
  }

  Widget buildUnFavorButton() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(180.r)),
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
          width: 30.w,
          height: 30.w,
          child: CircularProgressIndicator(
            strokeWidth: 2.r,
            color: HYAppTheme.norMainThemeColors,
            value: animation.value,
          ),
        ),
        Container(
          width: 20.w,
          height: 20.w,
          child: Image.asset(ImageAssets.likeCustomPNG),
        )
      ],
    );
  }
}
