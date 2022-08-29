import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../core/model/dan_mu_model_02.dart';
import '../../../../core/service/request/dan_mu_request.dart';
import '../../../shared/color_radix_change.dart';
import '../../../shared/math_compute.dart';
import '../../../shared/text_height_width.dart';
import 'initialize_dan_mu.dart';

class BuildDanMuProtoScreen extends StatefulWidget {
  BuildDanMuProtoScreen({
    Key? key,
    required this.width,
    required this.oid,
    required this.duration,
  }) : super(key: key);

  ///屏幕宽度
  double width;

  ///视频oid
  int oid;

  ///视频时长(几分钟的，弹幕是六分钟一包
  int duration;

  @override
  BuildDanMuProtoScreenState createState() => BuildDanMuProtoScreenState();
}

class BuildDanMuProtoScreenState extends State<BuildDanMuProtoScreen> {
  int segmentIndex = 1;
  List<Widget> dMWidgets = [];
  List<double> speedList = [];
  int routeNum = 0;

  ///记录轨道时间（稍微往后延一点时间，视频加载需要时间）
  List<double> movingDMRoutesTime = [0, 0, 0, 0, 0, 0];
  List<double> topDMRoutesTime = [0, 0, 0];
  List<double> bottomDMRoutesTime = [0, 0, 0];

  @override
  void initState() {
    ///像素每毫秒
    for (int i = 0; i < moveTimeList.length; i++) {
      speedList.add(widget.width / moveTimeList[i]);
    }

    int segmentIndex = widget.duration ~/ 6 + 1;
    getDMPackage(segmentIndex);
    segmentIndex--;

    ///六分钟一包
    if (segmentIndex > 0) {
      Timer.periodic(const Duration(milliseconds: 350000), (timer) {
        getDMPackage(segmentIndex);
        segmentIndex--;

        ///当弹幕包取完了就可以取消计时器了
        if (segmentIndex <= 0) {
          timer.cancel();
        }
      });
    }

    super.initState();
  }

  ///获取弹幕包
  void getDMPackage(int segmentIndex) {
    HYDanMuRequest.getDanMuProtoData(widget.oid, segmentIndex).then((value) {
      ///发送时间做排序排序
      value.sort((left, right) => left.progress.compareTo(right.progress));

      ///滚动弹幕、顶部弹幕、底部弹幕
      List<DanMuModel02> customDanMuList = [];
      List<DanMuModel02> topDanMuList = [];
      List<DanMuModel02> bottomDanMuList = [];

      ///最多装填1000条弹幕，太多弹幕会卡顿严重
      value = value.sublist(0, value.length > 300 ? 300 : value.length);
      for (var element in value) {
        // print(element.content);
        // print(element.progress);

        ///普通弹幕
        if (element.mode == 1 || element.mode == 2 || element.mode == 3) {
          customDanMuList.add(element);
        } else if (element.mode == 4) {
          ///底部弹幕
          bottomDanMuList.add(element);
        } else if (element.mode == 5) {
          ///顶部弹幕
          topDanMuList.add(element);
        } else {}
      }

      // topDanMuList = topDanMuList.sublist(0,100);

      ///构建移动弹幕
      for (int i = 0; i < customDanMuList.length; i++) {
        ///选择轨道（目前是最短的选中，随机值的话也可）
        int routeNum = getListMin(movingDMRoutesTime);

        ///弹幕在那一时刻发出，但是如果弹幕早就发出了，而选中的那个轨道排队的弹幕很多，你就得延后发
        int sendTime = customDanMuList[i].progress +
            getMovingDelayTime(customDanMuList[i].progress, routeNum);

        ///弹幕内容
        String content = customDanMuList[i].content;

        ///弹幕颜色
        Color color = ColorRadixChange.hexColor(
            customDanMuList[i].color.toRadixString(16));

        ///弹幕字体大小（这里原本数据传来我设置后发现太大了
        double fontSize = customDanMuList[i].fontsize - 12;

        ///不同轨道有不同速度，对应弹幕从右边移到左边的时间不同
        int moveTime = moveTimeList[routeNum];

        ///弹幕有长有短，所以需要弹幕显示在屏幕上的宽度
        double textLength = TextHeightWidth.boundingTextSize(
          customDanMuList[i].content,
          TextStyle(fontSize: customDanMuList[i].fontsize - 12),
        ).width;

        ///构建一个移动的弹幕
        SendMovingDM sendDM = SendMovingDM(
          sendTime: sendTime,
          routeNum: routeNum,
          content: content,
          color: color,
          fontSize: fontSize,
          moveTime: moveTime,
        );

        ///扔到stack布局中
        dMWidgets.add(sendDM);

        ///更新轨道数组，防止弹幕叠在一起了，这里延迟了500毫秒
        movingDMRoutesTime[routeNum] =
            sendTime + textLength / speedList[routeNum] + 500;
      }

      ///顶部弹幕
      for (int i = 0; i < topDanMuList.length; i++) {
        ///选择轨道（目前是最短的选中，随机值的话也可）
        int routeNum = getListMin(topDMRoutesTime);

        ///弹幕在那一时刻发出
        int sendTime = topDanMuList[i].progress +
            getTopDelayTime(topDanMuList[i].progress, routeNum);

        ///弹幕内容
        String content = topDanMuList[i].content;

        ///弹幕颜色
        Color color =
            ColorRadixChange.hexColor(topDanMuList[i].color.toRadixString(16));

        ///弹幕字体大小（这里原本数据传来我设置后发现太大了
        double fontSize = topDanMuList[i].fontsize - 12;

        ///弹幕显示时间
        int showTime = showTimeList[routeNum];

        ///构建一个移动的弹幕
        SendTopDM sendTopDM = SendTopDM(
          sendTime: sendTime,
          routeNum: routeNum,
          content: content,
          color: color,
          fontSize: fontSize,
          showTime: showTime,
        );

        ///扔到stack布局中
        dMWidgets.add(sendTopDM);

        ///更新轨道数组
        if (sendTime > topDMRoutesTime[routeNum]) {
          topDMRoutesTime[routeNum] += (showTime + sendTime + 1000);
        } else if (sendTime == topDMRoutesTime[routeNum]) {
          topDMRoutesTime[routeNum] += (showTime + 1000);
        } else {
          ///小于是不可能的
        }

        // print("####${topDanMuList[i].progress}");
        // print("####${sendTime}");
        //
        // for (var i in topDMRoutesTime) {
        //   print(i);
        // }
        // print("######");
      }

      ///底部弹幕
      for (int i = 0; i < bottomDanMuList.length; i++) {
        ///选择轨道（目前是最短的选中，随机值的话也可）
        int routeNum = getListMin(bottomDMRoutesTime);

        ///弹幕在那一时刻发出
        int sendTime = bottomDanMuList[i].progress +
            getBottomDelayTime(bottomDanMuList[i].progress, routeNum);

        ///弹幕内容
        String content = bottomDanMuList[i].content;

        ///弹幕颜色
        Color color = ColorRadixChange.hexColor(
            bottomDanMuList[i].color.toRadixString(16));

        ///弹幕字体大小（这里原本数据传来我设置后发现太大了
        double fontSize = bottomDanMuList[i].fontsize - 12;

        ///弹幕显示时间
        int showTime = showTimeList[routeNum];

        ///构建一个移动的弹幕
        SendBottomDM sendBottomDM = SendBottomDM(
          sendTime: sendTime,
          routeNum: routeNum,
          content: content,
          color: color,
          fontSize: fontSize,
          showTime: showTime,
        );

        ///扔到stack布局中
        dMWidgets.add(sendBottomDM);

        ///更新轨道数组
        if (sendTime > bottomDMRoutesTime[routeNum]) {
          bottomDMRoutesTime[routeNum] += (showTime + sendTime + 1000);
        } else if (sendTime == bottomDMRoutesTime[routeNum]) {
          bottomDMRoutesTime[routeNum] += (showTime + 1000);
        } else {
          ///小于是不可能的
        }
      }

      if (mounted) {
        setState(() {});
      }
    });
  }

  ///延迟发送
  int getMovingDelayTime(int sendTime, int routeNum) {
    double delayTime = 0;

    ///如果当前选择的最短轨道比你发射时间还长
    if (movingDMRoutesTime[routeNum] > sendTime) {
      delayTime = movingDMRoutesTime[routeNum] - sendTime;
    }
    return delayTime.toInt();
  }

  ///延迟发送
  int getTopDelayTime(int sendTime, int routeNum) {
    double delayTime = 0;

    ///如果当前选择的最短轨道比你发射时间还长
    if (topDMRoutesTime[routeNum] > sendTime) {
      delayTime += topDMRoutesTime[routeNum] - sendTime;
    }
    return delayTime.toInt();
  }

  ///延迟发送
  int getBottomDelayTime(int sendTime, int routeNum) {
    double delayTime = 0;

    ///如果当前选择的最短轨道比你发射时间还长
    if (bottomDMRoutesTime[routeNum] > sendTime) {
      delayTime = bottomDMRoutesTime[routeNum] - sendTime;
    }
    return delayTime.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.transparent,
      child: LayoutBuilder(
        builder: (context, constraintType) {
          return Stack(
            alignment: Alignment.center,
            children: dMWidgets,
          );
        },
      ),
    );
  }
}

///发送滚动弹幕
class SendMovingDM extends StatefulWidget {
  SendMovingDM({
    Key? key,
    required this.sendTime,
    required this.routeNum,
    required this.content,
    required this.color,
    required this.fontSize,
    required this.moveTime,
  }) : super(key: key);

  int sendTime;
  int routeNum;
  String content;
  Color color;
  double fontSize;
  int moveTime;

  @override
  State<SendMovingDM> createState() => _SendMovingDMState();
}

class _SendMovingDMState extends State<SendMovingDM>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        duration: Duration(milliseconds: widget.moveTime), vsync: this);
    _animation = Tween(begin: Offset(1.0, .0), end: Offset(-1.0, .0))
        .animate(_controller);
    _timer = Timer(Duration(milliseconds: widget.sendTime), () {
      _controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      ///这里的fill是指整个stack的position，去掉之后就是相对上一个弹幕
      top: movingDMRouteTop[widget.routeNum],
      child: SlideTransition(
          position: _animation,

          ///文本如果过长
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Text(
                widget.content,
                style: TextStyle(
                  color: widget.color,
                  fontSize: widget.fontSize,
                ),
              )
            ],
          )),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }
}

///发送顶部弹幕
class SendTopDM extends StatefulWidget {
  SendTopDM(
      {Key? key,
      required this.sendTime,
      required this.routeNum,
      required this.content,
      required this.color,
      required this.fontSize,
      required this.showTime})
      : super(key: key);

  int sendTime;
  int routeNum;
  String content;
  Color color;
  double fontSize;
  int showTime;

  @override
  State<SendTopDM> createState() => _SendTopDMState();
}

class _SendTopDMState extends State<SendTopDM>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        duration: Duration(milliseconds: widget.showTime ~/ 2), vsync: this);
    _animation = Tween(begin: 0.0, end: 10.0).animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
    _timer = Timer(Duration(milliseconds: widget.sendTime), () {
      _controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topDMRouteTop[widget.routeNum],
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Opacity(
            opacity: _animation.value > 1 ? 1 : _animation.value,
            child: Text(
              widget.content,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: TextStyle(
                color: widget.color,
                fontSize: widget.fontSize,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeStatusListener((status) {});
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }
}

class SendBottomDM extends StatefulWidget {
  SendBottomDM(
      {Key? key,
      required this.sendTime,
      required this.routeNum,
      required this.content,
      required this.color,
      required this.fontSize,
      required this.showTime})
      : super(key: key);

  int sendTime;
  int routeNum;
  String content;
  Color color;
  double fontSize;
  int showTime;

  @override
  State<SendBottomDM> createState() => _SendBottomDMState();
}

class _SendBottomDMState extends State<SendBottomDM>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        duration: Duration(milliseconds: widget.showTime ~/ 2), vsync: this);
    _animation = Tween(begin: 0.0, end: 10.0).animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
    _timer = Timer(Duration(milliseconds: widget.sendTime), () {
      _controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: bottomDMRouteTop[widget.routeNum],
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Opacity(
            opacity: _animation.value > 1 ? 1 : _animation.value,
            child: Text(
              widget.content,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: TextStyle(
                color: widget.color,
                fontSize: widget.fontSize,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeStatusListener((status) {});
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }
}