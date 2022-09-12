import 'package:bilibili_getx/ui/pages/video_play/video_play_logic.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui' as ui;
import '../../../shared/app_theme.dart';
import '../../../shared/math_compute.dart';

class BilibiliVideoProgressController extends StatefulWidget {
  const BilibiliVideoProgressController({Key? key}) : super(key: key);

  @override
  BilibiliVideoProgressControllerState createState() =>
      BilibiliVideoProgressControllerState();
}

class BilibiliVideoProgressControllerState
    extends State<BilibiliVideoProgressController> {
  final logic = Get.put(VideoPlayLogic());
  final state = Get.find<VideoPlayLogic>().state;

  @override
  Widget build(BuildContext context) {
    ///视频播放错误
    if (state.latestValue.hasError) {
      return state.chewieController.errorBuilder?.call(
              context,
              state.chewieController.videoPlayerController.value
                  .errorDescription!) ??
          Container(
            height: double.infinity,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image/icon/loading_video_failed.png",
                  width: 90.w,
                  height: 90.w,
                ),
                20.horizontalSpace,
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          HYAppTheme.norMainThemeColors),
                    ),
                    onPressed: () {},
                    child: Text("刷新一下",
                        style: TextStyle(color: Colors.white, fontSize: 12.sp)))
              ],
            ),
          );
    }

    ///MouseRegion检测鼠标移入移出
    return MouseRegion(
      ///鼠标在区域内移动时的回调
      onHover: (_) {
        logic.cancelAndRestartTimer();
      },
      child: GestureDetector(
        onTap: () {
          logic.cancelAndRestartTimer();
        },
        onDoubleTap: () {
          print("onDoubleTap");
        },
        child: AbsorbPointer(
          absorbing: state.hideStuff,
          child: Stack(
            children: [
              ///在缓冲
              state.latestValue.isBuffering
                  ? Center(
                      child: Image.asset(
                        ImageAssets.ploadingGif,
                        width: 25.w,
                        height: 25.w,
                      ),
                    )
                  : const Center(),

              ///底部工具栏
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: state.barHeight,
                  child: buildBottomBar(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final oldController = state.chewieController;
    state.chewieController = ChewieController.of(context);
    state.videoPlayerController = state.chewieController.videoPlayerController;

    if (oldController != state.chewieController) {
      logic.dispose();
      logic.initializeBilibiliVideoProgressControl();
    }
    super.didChangeDependencies();
  }

  AnimatedOpacity buildBottomBar() {
    return AnimatedOpacity(
      opacity: state.hideStuff ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: SafeArea(
        bottom: state.chewieController.isFullScreen,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0).r,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(.1),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildHitArea(),
              buildProgressBar(),
              buildPosition(),
              buildExpandButton(),
            ],
          ),
        ),
      ),
    );
  }

  ///视频播放的时长及当前位置
  Widget buildPosition() {
    final position = state.latestValue.position;
    final duration = state.latestValue.duration;

    ///富文本
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15).r,
      child: RichText(
        text: TextSpan(
          text: '${formatDuration(position)} ',
          children: <InlineSpan>[
            TextSpan(
              text: '/ ${formatDuration(duration)}',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white.withOpacity(.9),
              ),
            )
          ],
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.white.withOpacity(.9),
          ),
        ),
      ),
    );
  }

  ///暂停的按钮
  Widget buildHitArea() {
    final bool isFinished =
        state.latestValue.position >= state.latestValue.duration;
    final bool showPlayButton =
        state.showPlayButton && !state.dragging && !state.hideStuff;

    return GestureDetector(
      onTap: () {
        logic.tapPlayButton();
      },
      child: PlayButton(
        iconColor: Colors.white,
        isFinished: isFinished,
        isPlaying: state.videoPlayerController.value.isPlaying,
        show: showPlayButton,
        onPressed: logic.playPause,
      ),
    );
  }

  ///全屏按钮
  GestureDetector buildExpandButton() {
    return GestureDetector(
      onTap: logic.onExpandCollapse,
      child: AnimatedOpacity(
        opacity: state.hideStuff ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: state.chewieController.isFullScreen
            ? const Icon(
                Icons.fullscreen_exit,
                color: Colors.white,
              )
            : Image.asset(
                "assets/image/icon/full_custom.png",
                width: 23.w,
                height: 23.h,
              ),
      ),
    );
  }

  ///进度条
  Widget buildProgressBar() {
    return Expanded(
      child: BilibiliVideoProgressBar(
        state.videoPlayerController,
        onDragStart: () {
          state.dragging = true;
          state.hideTimer.cancel();
        },
        onDragEnd: () {
          state.dragging = false;
          logic.startHideTimer();
        },
        colors: state.chewieController.materialProgressColors ??
            ChewieProgressColors(
              playedColor: HYAppTheme.norMainThemeColors,
              handleColor: const Color.fromRGBO(255, 255, 255, 1),
              bufferedColor: const Color.fromRGBO(255, 255, 255, .6),
              backgroundColor: const Color.fromRGBO(255, 255, 255, .3),
            ), handleHeight: 2.h,
        barHeight: 3.h, drawShadow: true,
      ),
    );
  }
}

///暂停按钮-播放按钮
class AnimatedPlayPause extends StatefulWidget {
  const AnimatedPlayPause({
    Key? key,
    required this.playing,
    this.size,
    this.color,
  }) : super(key: key);

  final double? size;
  final bool playing;
  final Color? color;

  @override
  State<StatefulWidget> createState() => AnimatedPlayPauseState();
}

class AnimatedPlayPauseState extends State<AnimatedPlayPause>
    with SingleTickerProviderStateMixin {
  late final animationController = AnimationController(
    vsync: this,
    value: widget.playing ? 1 : 0,
    duration: const Duration(milliseconds: 1000),
  );
  late CurvedAnimation animation;
  late Animation iconAnimation;

  @override
  void initState() {
    super.initState();
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.elasticInOut);
    iconAnimation = Tween(
      begin: -20.sp,
      end: -20.sp,
    ).animate(animation);
  }

  ///暂停按钮变成播放按钮，播放按钮变成暂停按钮（当父Widget setstate时）
  @override
  void didUpdateWidget(AnimatedPlayPause oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.playing != oldWidget.playing) {
      if (widget.playing) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: iconAnimation,
          builder: (ctx, child) {
            return Image.asset(
                widget.playing
                    ? ImageAssets.biliPlayerPlayCanPausePNG
                    : ImageAssets.bilibiliPlayerPlayCanPlayPNG,
                width: iconAnimation.value > 0
                    ? iconAnimation.value
                    : -iconAnimation.value,
                height: iconAnimation.value > 0
                    ? iconAnimation.value
                    : -iconAnimation.value);
          }),
    );
  }
}

///视频进度条
class BilibiliVideoProgressBar extends StatefulWidget {
  BilibiliVideoProgressBar(
    this.controller, {
    ChewieProgressColors? colors,
    this.onDragEnd,
    this.onDragStart,
    this.onDragUpdate,
    Key? key,
    required this.barHeight,
    required this.handleHeight,
    required this.drawShadow,
  })  : colors = colors ?? ChewieProgressColors(),
        super(key: key);

  final VideoPlayerController controller;
  final ChewieProgressColors colors;

  ///回调函数，当开始拖动时，做什么事情
  final Function()? onDragStart;
  final Function()? onDragEnd;
  final Function()? onDragUpdate;

  final double barHeight;
  final double handleHeight;
  final bool drawShadow;

  @override
  _BilibiliVideoProgressBarState createState() {
    return _BilibiliVideoProgressBarState();
  }
}

class _BilibiliVideoProgressBarState extends State<BilibiliVideoProgressBar> {
  ///进度条顶端图片
  ui.Image? image;

  void listener() {
    if (!mounted) return;
    setState(() {});
  }

  bool _controllerWasPlaying = false;

  VideoPlayerController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  /// 通过assets路径，获取资源图片
  Future<ui.Image> loadAssetImage(String path) async {
    // 加载资源文件
    final data = await rootBundle.load(path);
    // 把资源文件转换成Uint8List类型
    final bytes = data.buffer.asUint8List();
    // 解析Uint8List类型的数据图片
    final image = await decodeImageFromList(bytes);
    this.image = image;
    return image;
  }

  @override
  void deactivate() {
    controller.removeListener(listener);
    super.deactivate();
  }

  void _seekToRelativePosition(Offset globalPosition) {
    final box = context.findRenderObject()! as RenderBox;
    final Offset tapPos = box.globalToLocal(globalPosition);
    final double relative = tapPos.dx / box.size.width;
    final Duration position = controller.value.duration * relative;
    controller.seekTo(position);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (DragStartDetails details) {
        if (!controller.value.isInitialized) {
          return;
        }
        _controllerWasPlaying = controller.value.isPlaying;
        if (_controllerWasPlaying) {
          controller.pause();
        }

        widget.onDragStart?.call();
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        if (!controller.value.isInitialized) {
          return;
        }
        _seekToRelativePosition(details.globalPosition);

        widget.onDragUpdate?.call();
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        if (_controllerWasPlaying) {
          controller.play();
        }

        widget.onDragEnd?.call();
      },
      onTapDown: (TapDownDetails details) {
        if (!controller.value.isInitialized) {
          return;
        }
        _seekToRelativePosition(details.globalPosition);
      },
      child: FutureBuilder(
        ///加载进度条顶部的图片
        future: loadAssetImage("assets/image/icon/progress_bar.png"),
        builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
          return snapshot.data != null
              ? Center(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                      child: CustomPaint(
                        painter: _ProgressBarPainter(
                          assetsImage: snapshot.data!,
                          value: controller.value,
                          colors: widget.colors,
                          barHeight: widget.barHeight,
                          handleHeight: widget.handleHeight,
                          drawShadow: widget.drawShadow,
                        ),
                      )),
                )
              : Center();
        },
      ),
    );
  }
}

///进度条绘制
class _ProgressBarPainter extends CustomPainter {
  _ProgressBarPainter({
    required this.assetsImage,
    required this.value,
    required this.colors,
    required this.barHeight,
    required this.handleHeight,
    required this.drawShadow,
  });

  VideoPlayerValue value;
  ChewieProgressColors colors;

  final double barHeight;
  final double handleHeight;
  final bool drawShadow;

  final ui.Image assetsImage;

  @override
  bool shouldRepaint(CustomPainter painter) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final baseOffset = size.height / 2 - barHeight / 2;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(0.0, baseOffset),
          Offset(size.width, baseOffset + barHeight),
        ),
        const Radius.circular(4.0),
      ),
      colors.backgroundPaint,
    );
    if (!value.isInitialized) {
      return;
    }

    ///播放时长占比
    final double playedPartPercent =
        value.position.inMilliseconds / value.duration.inMilliseconds;

    ///播放的长度
    final double playedPart =
        playedPartPercent > 1 ? size.width : playedPartPercent * size.width;
    for (final DurationRange range in value.buffered) {
      final double start = range.startFraction(value.duration) * size.width;
      final double end = range.endFraction(value.duration) * size.width;

      ///视频缓存进度条
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromPoints(
            Offset(start, baseOffset),
            Offset(end, baseOffset + barHeight),
          ),
          const Radius.circular(4.0),
        ),
        colors.bufferedPaint,
      );
    }

    ///视频播放的进度条
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(0.0, baseOffset),
          Offset(playedPart, baseOffset + barHeight),
        ),
        const Radius.circular(4.0),
      ),
      colors.playedPaint,
    );

    if (drawShadow) {
      final Path shadowPath = Path()
        ..addOval(
          Rect.fromCircle(
            center: Offset(playedPart, baseOffset + barHeight / 2),
            radius: handleHeight,
          ),
        );

      canvas.drawShadow(shadowPath, Colors.black, 0.2, false);
    }

    canvas.drawImage(
        assetsImage,
        Offset(playedPart - barHeight * 2, baseOffset - barHeight * 2),
        colors.handlePaint);
    // canvas.drawCircle(Offset(playedPart, baseOffset + barHeight / 2),
    //     handleHeight, colors.handlePaint);
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key? key,
    this.iconColor,
    required this.show,
    required this.isPlaying,
    required this.isFinished,
    this.onPressed,
  }) : super(key: key);

  final Color? iconColor;
  final bool show;
  final bool isPlaying;
  final bool isFinished;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: show ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 50),
      child: IconButton(
        iconSize: 20.sp,
        icon: isFinished
            ? Image.asset(
                "assets/image/icon/video_replay.png",
              )
            : AnimatedPlayPause(
                color: iconColor,
                playing: isPlaying,
              ),
        onPressed: onPressed,
      ),
    );
  }
}


