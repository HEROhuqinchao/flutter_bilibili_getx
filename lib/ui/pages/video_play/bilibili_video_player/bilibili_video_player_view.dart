import 'dart:async';

import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui' as ui;
import '../../../../core/permission/bilibili_permission.dart';
import '../../../shared/math_compute.dart';
import '../../../widgets/progress_bar_painter.dart';
import 'bilibili_video_player_logic.dart';

///视频播放界面，传入视频源（videoOriginalUrl），控制需要显示的组件即可
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
    return GetBuilder<BilibiliVideoPlayerLogic>(builder: (logic) {
      return Center(
        child: !state.isLoadingVideo
            ? GestureDetector(
                onHorizontalDragStart: (DragStartDetails details) {
                  logic.videoPlayProgressOnHorizontalDragStart();
                },
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  logic.videoPlayScreenOnHorizontalDragUpdate(
                      context, details.delta);
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
                child: buildVideoPlayer(),
              )
            : buildVideoLoading(),
      );
    });
  }

  @override
  void dispose() {
    Get.delete<BilibiliVideoPlayerComponent>();
    super.dispose();
  }

  ///构建视频和弹幕
  Widget buildVideoPlayer() {
    return state.videoPlayerController.value.aspectRatio < 1
        ? buildVerticalVideo()
        : buildHorizonVideo();
  }

  ///垂直视频
  Widget buildVerticalVideo() {
    return Container(
      child: Text(
        "垂直视频功能待完善",
        style: TextStyle(color: HYAppTheme.norWhite01Color, fontSize: 15.sp),
      ),
    );
  }

  ///视频播放的时长及当前位置
  Widget buildPosition() {
    final position = state.videoPlayerController.value.position;
    final duration = state.videoPlayerController.value.duration;

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
      ///注意此处的context
      child: LayoutBuilder(builder: (ctx, con) {
        return buildBilibiliVideoProgressBar(ctx);
      }),
    );
  }

  Widget buildBilibiliVideoProgressBar(context) {
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
                  width: 1.sw,
                  height: 1.sh,
                  color: Colors.transparent,
                  child: CustomPaint(
                    painter: ProgressBarPainter(
                      handleHeight: 4.h,
                      assetsImage: snapshot.data!,
                      barHeight: 4.h,
                      drawShadow: true,
                      videoPlayerValue: state.videoPlayerController.value,
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
        width: 27.sp,
        height: 27.sp,
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
        absorbing: !state.showBottomBar && !state.showTopBar,
        child: Container(
          color: HYAppTheme.norTextColors,
          width: 1.sw,
          child: Stack(
            children: [
              Center(
                child: Container(
                  color: Colors.black,
                  width: 1.sw,
                  child: AspectRatio(
                    aspectRatio: state.videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(
                      state.videoPlayerController,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                  opacity: state.showTopBar ? 1 : 0,
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  child: Container(
                    alignment: Alignment.topCenter,
                    height: 40.h,
                    width: 1.sw,
                    padding:
                        EdgeInsets.only(left: 15.r, right: 10.r, top: 15.r),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(.7),
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.arrow_back_rounded,
                              size: 20.sp,
                              color: HYAppTheme.norWhite01Color,
                            ),
                            30.horizontalSpace,
                            Image.asset(
                              ImageAssets.videoHomePNG,
                              width: 20.sp,
                              height: 20.sp,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            ///请求下载的权限
                            BilibiliPermission.requestDownloadPermissions();

                            ///初始化下载列表
                            logic.iniDownloadList();

                            ///创建下载目录
                            logic.iniDownloadFilePath();

                            ///弹出界面
                            showVideoShareAndMoreFunctionBottomDialog(context);
                          },
                          child: Image.asset(
                            ImageAssets.moreAndroidLightPNG,
                            width: 20.sp,
                            height: 20.sp,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
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
                    alignment: Alignment.topCenter,
                    height: 40.h,
                    width: 1.sw,
                    padding:
                        EdgeInsets.only(left: 15.r, right: 10.r, bottom: 15.r),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(.7),
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
                        state.haveProcessSlider
                            ? buildVideoPlayProgress()
                            : Container(),
                        5.horizontalSpace,
                        state.haveProcessTimePosition
                            ? buildPosition()
                            : Container(),
                        5.horizontalSpace,
                        state.haveFullScreenFunction
                            ? buildFullScreenButton()
                            : Container(),
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
                            color: HYAppTheme.norTextColors.withOpacity(.7),
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
                              height: 3.sp,
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
                            color: HYAppTheme.norTextColors.withOpacity(.7),
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
                              height: 3.sp,
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
              state.videoPlayerController.value.isBuffering &&
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

              ///弹幕
              state.haveDanMuFunction
                  ? IgnorePointer(
                      child: Opacity(
                        opacity: state.showDanMu ? 1 : 0,
                        child: Container(
                          margin: EdgeInsets.only(top: 10.r),
                          height: 180.w,
                          width: 1.sw,
                          child: Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: state.danMuWidgets,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container()
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
              width: 22.sp,
              height: 22.sp,
            ),
          )
        : GestureDetector(
            onTap: () {
              logic.openFullScreen();
            },
            child: Image.asset(
              ImageAssets.fullCustomPNG,
              width: 22.sp,
              height: 22.sp,
            ),
          );
  }

  ///视频分享和更多功能的底部弹框
  void showVideoShareAndMoreFunctionBottomDialog(context) {
    TextStyle textStyle = TextStyle(
      color: HYAppTheme.norGrayColor,
      fontSize: 14.sp,
    );
    showModalBottomSheet(
      builder: (BuildContext context) {
        return Container(
          height: .4.sh,
          color: HYAppTheme.norWhite01Color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 20.r),
                child: Text(
                  "分享",
                  style: TextStyle(
                      color: HYAppTheme.norTextColors, fontSize: 14.sp),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    if (index == 0) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeWxChatPNG,
                        Text("微信", style: textStyle),
                        () {},
                      );
                    } else if (index == 1) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeWxMomentPNG,
                        Text("朋友圈", style: textStyle),
                        () {},
                      );
                    } else if (index == 2) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeWxMomentPNG,
                        Text("下载分享", style: textStyle),
                        () {},
                      );
                    } else if (index == 3) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeQqChatPNG,
                        Text("QQ", style: textStyle),
                        () {},
                      );
                    } else if (index == 4) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeQqZonePNG,
                        Text("QQ空间", style: textStyle),
                        () {},
                      );
                    } else if (index == 5) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeDynamicPNG,
                        Text("动态", style: textStyle),
                        () {},
                      );
                    } else if (index == 6) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeWxMomentPNG,
                        Text("信息", style: textStyle),
                        () {},
                      );
                    } else if (index == 7) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeWxMomentPNG,
                        Text("图片分享", style: textStyle),
                        () {},
                      );
                    } else if (index == 8) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeWxMomentPNG,
                        Text("标记点分享", style: textStyle),
                        () {},
                      );
                    } else if (index == 9) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeCopyPNG,
                        Text("复制链接", style: textStyle),
                        () {},
                      );
                    } else if (index == 10) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeGenericPNG,
                        Text("更多", style: textStyle),
                        () {},
                      );
                    } else {
                      return Container();
                    }
                  },
                  itemCount: 11,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 20.r,
                      height: 20.r,
                    );
                  },
                ),
              ),
              Divider(
                color: HYAppTheme.norGrayColor.withOpacity(.8),
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 10.r),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    if (index == 0) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeWxChatPNG,
                        Text("稍后再看", style: textStyle),
                        () {},
                      );
                    } else if (index == 1) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeWxMomentPNG,
                        Text("缓存", style: textStyle),
                        () {
                          showVideoDownloadBottomDialog(context);
                        },
                      );
                    } else if (index == 2) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeWxMomentPNG,
                        Text("倍速播放", style: textStyle),
                        () {},
                      );
                    } else if (index == 3) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeQqChatPNG,
                        Text("播放设置", style: textStyle),
                        () {},
                      );
                    } else if (index == 4) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeQqZonePNG,
                        Text("听视频", style: textStyle),
                        () {},
                      );
                    } else if (index == 5) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeDynamicPNG,
                        Text("后台播放", style: textStyle),
                        () {},
                      );
                    } else if (index == 6) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeWxMomentPNG,
                        Text("笔记", style: textStyle),
                        () {},
                      );
                    } else if (index == 7) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeWxMomentPNG,
                        Text("举报", style: textStyle),
                        () {},
                      );
                    } else if (index == 8) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeWxMomentPNG,
                        Text("我不想看", style: textStyle),
                        () {},
                      );
                    } else if (index == 9) {
                      return buildColumnButton(
                        ImageAssets.biliSocializeCopyPNG,
                        Text("播放反馈", style: textStyle),
                        () {},
                      );
                    } else {
                      return Container();
                    }
                  },
                  itemCount: 10,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 20.r,
                      height: 20.r,
                    );
                  },
                ),
              ),
              Container(
                color: HYAppTheme.norWhite01Color,
                width: 1.sw,
                padding: EdgeInsets.symmetric(vertical: 15.r),
                child: Text(
                  "取消",
                  style: TextStyle(
                    color: HYAppTheme.norTextColors,
                    fontSize: 15.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        );
      },
      context: context,
    );
  }

  Widget buildColumnButton(imageName, textWidget, action) {
    return GestureDetector(
      onTap: () {
        action();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 45.r,
            height: 45.r,
            child: Image.asset(imageName),
          ),
          8.verticalSpace,
          textWidget,
        ],
      ),
    );
  }

  ///视频缓存
  void showVideoDownloadBottomDialog(context) {
    showModalBottomSheet(
      builder: (BuildContext context) {
        return GetBuilder<BilibiliVideoPlayerLogic>(builder: (logic) {
          return SingleChildScrollView(
            child: Container(
              height: .5.sh,
              child: Column(
                children: [
                  buildVideoDownloadHeader(),
                  buildVideoDownloadList(),
                  buildVideoDownloadFooter(),
                ],
              ),
            ),
          );
        });
      },
      context: context,
    );
  }

  Widget buildVideoDownloadList() {
    return state.downloadVideoList.isNotEmpty
        ? Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.r),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () async {
                      if (state.downloadVideoList[index].status ==
                          DownloadTaskStatus.running) {
                        logic.pauseDownloadFile(index);
                      } else if (state.downloadVideoList[index].status ==
                          DownloadTaskStatus.undefined) {
                        logic.downloadFile(index);
                      } else if (state.downloadVideoList[index].status ==
                          DownloadTaskStatus.failed) {
                        logic.retryDownloadFile(index);
                      } else if (state.downloadVideoList[index].status ==
                          DownloadTaskStatus.paused) {
                        logic.resumeDownloadFile(index);
                      } else if (state.downloadVideoList[index].status ==
                          DownloadTaskStatus.complete) {
                        final String filePath =
                            state.downloadVideoList[index].storagePath!;
                        final result = await OpenFile.open(filePath);
                        SmartDialog.showToast("已下载");
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.r, horizontal: 10.r),
                      margin:
                          EdgeInsets.symmetric(vertical: 8.r, horizontal: 10.r),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: HYAppTheme.norMainThemeColors,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4.r))),
                      width: 1.sw,
                      child: Row(
                        children: [
                          SizedBox(
                            width: .25.sw,
                            child: Text(
                              "下载视频$index",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: HYAppTheme.norMainThemeColors,
                                  fontSize: 14.sp),
                            ),
                          ),
                          15.horizontalSpace,
                          Expanded(
                              child: LinearProgressIndicator(
                            backgroundColor:
                                HYAppTheme.norGrayColor.withOpacity(.5),
                            color: HYAppTheme.norMainThemeColors,
                            value: state.downloadVideoList[index].progress < 0
                                ? 0
                                : state.downloadVideoList[index].progress,
                          )),
                          10.horizontalSpace,
                          Text(
                              "${(state.downloadVideoList[index].progress).toInt()}%"),
                          30.horizontalSpace,
                          SizedBox(
                            width: 20.sp,
                            height: 20.sp,
                            child: Image.asset(
                              buildDownloadStatueIcon(index),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 2,
              ),
            ),
          )
        : Container();
  }

  Widget buildVideoDownloadHeader() {
    return Container(
      decoration: BoxDecoration(
          border: BorderDirectional(
              bottom:
                  BorderSide(color: HYAppTheme.norGrayColor.withOpacity(.5)))),
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 8.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "下载缓存",
            style: TextStyle(
              color: HYAppTheme.norTextColors,
              fontSize: 15.sp,
            ),
          ),
          const Icon(
            Icons.clear,
            color: HYAppTheme.norGrayColor,
          )
        ],
      ),
    );
  }

  Widget buildVideoDownloadFooter() {
    return Container(
      decoration: const BoxDecoration(
          border: BorderDirectional(
              top: BorderSide(color: HYAppTheme.norGrayColor))),
      padding: EdgeInsets.symmetric(vertical: 10.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "缓存全部",
            style: TextStyle(
              color: HYAppTheme.norTextColors,
              fontSize: 15.sp,
            ),
          ),
          Text(
            "|",
            style: TextStyle(
              color: HYAppTheme.norGrayColor,
              fontSize: 15.sp,
            ),
          ),
          Text(
            "查看缓存",
            style: TextStyle(
              color: HYAppTheme.norTextColors,
              fontSize: 15.sp,
            ),
          )
        ],
      ),
    );
  }

  String buildDownloadStatueIcon(index) {
    if (state.downloadVideoList[index].status == DownloadTaskStatus.complete) {
      return ImageAssets.icVideoDownloadCompletePNG;
    } else if (state.downloadVideoList[index].status ==
        DownloadTaskStatus.paused) {
      return ImageAssets.icVideoDownloadStopPNG;
    } else if (state.downloadVideoList[index].status ==
        DownloadTaskStatus.running) {
      return ImageAssets.icVideoDownloadProcessingPNG;
    } else if (state.downloadVideoList[index].status ==
        DownloadTaskStatus.enqueued) {
      return ImageAssets.icVideoDownloadStopPNG;
    } else if (state.downloadVideoList[index].status ==
        DownloadTaskStatus.failed) {
      return ImageAssets.icVideoDownloadErrorPNG;
    } else {
      return ImageAssets.icVideoDownloadStopPNG;
    }
  }
}
