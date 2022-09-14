import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui' as ui;
import '../../../shared/math_compute.dart';
import 'bilibili_video_player_logic.dart';

final logic = Get.put(BilibiliVideoPlayerLogic());
final state = Get.find<BilibiliVideoPlayerLogic>().state;

class BilibiliVideoPlayerComponent extends StatefulWidget {
  @override
  State<BilibiliVideoPlayerComponent> createState() =>
      _BilibiliVideoPlayerComponentState();
}

class _BilibiliVideoPlayerComponentState
    extends State<BilibiliVideoPlayerComponent> {
  final logic = Get.put(BilibiliVideoPlayerLogic());
  final state = Get.find<BilibiliVideoPlayerLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HYAppTheme.norTextColors,
        body: GetBuilder<BilibiliVideoPlayerLogic>(builder: (logic) {
          return Center(
            child: state.videoPlayerController.value.isInitialized
                ? GestureDetector(
                    onHorizontalDragStart: (DragStartDetails details) {
                      logic.videoPlayProgressOnHorizontalDragStart();
                    },
                    onHorizontalDragUpdate: (DragUpdateDetails details) {
                      logic.videoPlayProgressOnHorizontalDragUpdate(
                          context, details.globalPosition);
                    },
                    onHorizontalDragEnd: (DragEndDetails details) {
                      logic.videoPlayProgressOnHorizontalDragEnd();
                    },
                    onVerticalDragStart: (DragStartDetails details) {
                      logic.videoPlayVolumeBrightnessOnVerticalDragStart(details);
                    },
                    onVerticalDragEnd: (DragEndDetails details) {
                      logic.videoPlayVolumeBrightnessOnVerticalDragEnd();
                    },
                    onVerticalDragUpdate: (DragUpdateDetails details) {
                      logic.videoPlayVolumeBrightnessOnVerticalDragUpdate(details);
                    },
                    child: SizedBox(
                      height: 200.w,
                      width: 1.sw,
                      child: buildVideoPlayer(),
                    ),
                  )
                : buildVideoLoading(),
          );
        }),
      ),
    );
  }

  Widget buildVideoPlayer() {
    return state.videoPlayerController.value.aspectRatio < 1
        ? buildVerticalVideo()
        : buildHorizonVideo();
  }

  ///垂直视频
  Widget buildVerticalVideo() {
    return GestureDetector(
      onTap: () {
        logic.cancelAndRestartTimer();
      },
      onDoubleTap: () {
        ///双击播放或暂停
        logic.playOrPauseVideo();
      },
      child: AbsorbPointer(
        ///点击响应的是进度条还是屏幕
        absorbing: !state.showBottomBar,
        child: Stack(
          children: [
            Container(
              color: Colors.black,
              height: 1.sh,
              width: 1.sw,
              child: AspectRatio(
                aspectRatio: state.videoPlayerController.value.aspectRatio,
                child: VideoPlayer(
                  state.videoPlayerController,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: state.showBottomBar ? 1 : 0,
                duration: const Duration(
                  milliseconds: 300,
                ),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 60.h,
                  width: 1.sw,
                  padding: EdgeInsets.only(left: 10.r, right: 5.r),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(.3),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Row(
                    children: [
                      buildVideoPlayOrPauseButton(),
                      10.horizontalSpace,
                      buildVideoPlayProgress(),
                      10.horizontalSpace,
                      buildPosition(),
                    ],
                  ),
                ),
              ),
            ),

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
          ],
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

  ///视频进度条
  Widget buildVideoPlayProgress() {
    return Expanded(
      child: BilibiliVideoProgressBar(),
    );
  }

  ///播放还是暂停按钮
  Widget buildVideoPlayOrPauseButton() {
    return GestureDetector(
      onTap: () {
        logic.playOrPauseVideo();
      },
      child: Image.asset(
        state.videoPlayerController.value.isPlaying
            ? ImageAssets.biliPlayerPlayCanPausePNG
            : ImageAssets.bilibiliPlayerPlayCanPlayPNG,
        width: 30.sp,
        height: 30.sp,
      ),
    );
  }

  ///水平视频
  Widget buildHorizonVideo() {
    return GestureDetector(
      onTap: () {
        logic.cancelAndRestartTimer();
      },
      onDoubleTap: () {
        ///双击播放或暂停
        logic.playOrPauseVideo();
      },
      child: AbsorbPointer(
        absorbing: !state.showBottomBar,
        child: SizedBox(
          width: 1.sw,
          child: Stack(
            children: [
              Container(
                color: Colors.black,
                width: 1.sw,
                child: AspectRatio(
                  aspectRatio: state.videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(
                    state.videoPlayerController,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                  opacity: state.showBottomBar ? 1 : 0,
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: 50.h,
                    width: 1.sw,
                    padding: EdgeInsets.only(left: 10.r, right: 5.r),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(.3),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Row(
                      children: [
                        buildVideoPlayOrPauseButton(),
                        10.horizontalSpace,
                        buildVideoPlayProgress(),
                        5.horizontalSpace,
                        buildPosition(),
                        5.horizontalSpace,
                        buildFullScreenButton(),
                        5.horizontalSpace,
                      ],
                    ),
                  ),
                ),
              ),

              ///视频的进度显示框
              state.videoProgress
                  ? Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.r, horizontal: 10.r),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: HYAppTheme.norTextColors, width: .5.sp),
                          color: HYAppTheme.norTextColors.withOpacity(.8),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.r),
                          ),
                        ),
                        child: Text(
                          "${formatDuration(state.videoPlayerController.value.position)} / ${formatDuration(state.videoPlayerController.value.duration)}",
                          style: TextStyle(
                            color: HYAppTheme.norWhite01Color,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    )
                  : const Center(),

              ///视频的亮度值显示框
              state.videoBrightness
                  ? Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: HYAppTheme.norTextColors.withOpacity(.4),
                      borderRadius:
                      BorderRadius.all(Radius.circular(5.r))),
                  padding: EdgeInsets.symmetric(
                      horizontal: 12.r, vertical: 8.r),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 22.sp,
                        height: 22.sp,
                        child: Image.asset(ImageAssets.brightnessPNG),
                      ),
                      8.horizontalSpace,
                      SizedBox(
                        width: 65.w,
                        height: 3.w,
                        child: LinearProgressIndicator(
                          backgroundColor: HYAppTheme.norWhite01Color,
                          value: state.brightness,
                          color: HYAppTheme.norMainThemeColors,
                        ),
                      ),
                    ],
                  ),
                ),
              )
                  : const Center(),

              ///视频的音量显示框
              state.videoVolume
                  ? Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: HYAppTheme.norTextColors.withOpacity(.4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r))),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.r, vertical: 8.r),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            state.volume > 0
                                ? SizedBox(
                                    width: 22.sp,
                                    height: 22.sp,
                                    child: Image.asset(ImageAssets.volumePNG),
                                  )
                                : SizedBox(
                                    width: 22.sp,
                                    height: 22.sp,
                                    child: Image.asset(ImageAssets.volume0PNG),
                                  ),
                            8.horizontalSpace,
                            SizedBox(
                              width: 65.w,
                              height: 3.w,
                              child: LinearProgressIndicator(
                                backgroundColor: HYAppTheme.norWhite01Color,
                                value: state.volume,
                                color: HYAppTheme.norMainThemeColors,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const Center(),

              ///在缓冲
              state.latestValue.isBuffering &&
                      !state.videoProgress &&
                      !state.videoVolume
                  ? Center(
                      child: Image.asset(
                        ImageAssets.ploadingGif,
                        width: 25.w,
                        height: 25.w,
                      ),
                    )
                  : const Center(),
            ],
          ),
        ),
      ),
    );
  }

  ///加载视频
  Widget buildVideoLoading() {
    return const CircularProgressIndicator(
      color: HYAppTheme.norMainThemeColors,
    );
  }

  Widget buildFullScreenButton() {
    return state.isFullScreen
        ? GestureDetector(
            onTap: () {
              logic.closeFullScreen();
            },
            child: Image.asset(
              ImageAssets.exitFullScreenPNG,
              width: 23.sp,
              height: 23.sp,
            ),
          )
        : GestureDetector(
            onTap: () {
              logic.openFullScreen();
            },
            child: Image.asset(
              ImageAssets.fullCustomPNG,
              width: 23.sp,
              height: 23.sp,
            ),
          );
  }
}

///进度条绘制
class ProgressBarPainter extends CustomPainter {
  ProgressBarPainter({
    required this.assetsImage,
    required this.value,
    required this.barHeight,
    required this.handleHeight,
    required this.drawShadow,
  });

  VideoPlayerValue value;

  final double barHeight;
  final double handleHeight;
  final bool drawShadow;

  final Paint playedPaint = Paint()..color = HYAppTheme.norMainThemeColors;
  final Paint bufferedPaint = Paint()
    ..color = const Color.fromRGBO(255, 255, 255, 1);
  final Paint handlePaint = Paint()
    ..color = const Color.fromRGBO(255, 255, 255, .6);
  final Paint backgroundPaint = Paint()
    ..color = const Color.fromRGBO(255, 255, 255, .3);

  final ui.Image assetsImage;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
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
      backgroundPaint,
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
        bufferedPaint,
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
      playedPaint,
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
        handlePaint);
    // canvas.drawCircle(Offset(playedPart, baseOffset + barHeight / 2),
    //     handleHeight, colors.handlePaint);
  }
}

class BilibiliVideoProgressBar extends StatelessWidget {
  ///context需要取expande里面的组件
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (DragStartDetails details) {
        logic.videoPlayProgressOnHorizontalDragStart();
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        logic.videoPlayProgressOnHorizontalDragUpdate(
            context, details.globalPosition);
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        logic.videoPlayProgressOnHorizontalDragEnd();
      },
      onTapDown: (TapDownDetails details) {
        logic.videoPlayProgressOnTapDown(context, details.globalPosition);
      },
      child: FutureBuilder(
        future: loadAssetImage(ImageAssets.progressBarHeaderPNG),
        builder: (BuildContext ctx, AsyncSnapshot<ui.Image> snapshot) {
          return snapshot.data != null
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                  child: CustomPaint(
                    painter: ProgressBarPainter(
                      handleHeight: 2.h,
                      assetsImage: snapshot.data!,
                      value: state.videoPlayerController.value,
                      barHeight: 3.h,
                      drawShadow: true,
                    ),
                  ),
                )
              : const Center();
        },
      ),
    );
  }

  /// 通过assets路径，获取资源图片
  Future<ui.Image> loadAssetImage(String path) async {
    // 加载资源文件
    final data = await rootBundle.load(path);
    // 把资源文件转换成Uint8List类型
    final bytes = data.buffer.asUint8List();
    // 解析Uint8List类型的数据图片
    final image = await decodeImageFromList(bytes);
    state.image = image;
    return image;
  }
}
