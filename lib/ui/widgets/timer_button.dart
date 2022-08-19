import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import '../../core/I18n/str_res_keys.dart';
import '../shared/app_theme.dart';

///倒计时的按钮（例如发送验证码的按钮）
class TimerButton extends StatefulWidget {
  ///倒计时时间
  int timeClock;

  ///按钮初始文本
  String originalButtonText;

  ///按钮点击后再重新恢复后的文本
  String retryButtonText;

  ///点击执行的操作
  Function() onTap;

  ///计时器是否有用
  bool isEnable;

  TimerButton({Key? key,
    this.timeClock = 60,
    this.originalButtonText = SR.sendCode,
    this.retryButtonText = SR.retrySendCode,
    required this.onTap,
    this.isEnable = true,
  }) : super(key: key);

  @override
  State<TimerButton> createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  late Timer _timer;
  late int timeClock;

  ///我是干净的，点击之后，我不干净了
  bool _iAmClean = true;

  ///正在倒计时
  late bool isRunning;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 1), () {});
    isRunning = false;
    timeClock = widget.timeClock;
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isEnable) {
          if (isRunning == false) {
            isRunning = true;
            setState(() {});
            _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
              timeClock--;
              setState(() {});
              if (timeClock == 0) {
                timeClock = widget.timeClock;
                isRunning = false;
                _iAmClean = false;
                timer.cancel();
              }
            });
            widget.onTap();
          } else {
            SmartDialog.showToast("着什么急呀，真的是~");
          }
        } else {
          widget.onTap();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: HYAppTheme.norGrayColor.withOpacity(.5)),
          ),
        ),
        padding: const EdgeInsets.only(left: 20).r,
        child: isRunning == false
            ? Text(
          _iAmClean == true
                    ? widget.originalButtonText.tr
                    : widget.retryButtonText.tr,
                style: TextStyle(
                  color: HYAppTheme.norMainThemeColors,
                  fontSize: HYAppTheme.xxSmallFontSize,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Text(
          timeClock.toString() + SR.secondRetry.tr,
                style: TextStyle(
                  color: HYAppTheme.norGrayColor,
                  fontSize: HYAppTheme.xxSmallFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
