import 'dart:async';
import 'dart:ui' as ui;
import 'package:chewie/chewie.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/model/feed_index_model.dart';
import '../../core/model/video_model.dart';
import '../../core/notifier/player_notifier.dart';
import '../shared/app_theme.dart';
import '../shared/image_asset.dart';

const debug = true;

class HYBilibiliControls extends StatefulWidget {
  const HYBilibiliControls({
    this.showPlayButton = true,
    this.showVideoActions = true,
    required this.video,
    Key? key,
  }) : super(key: key);

  final bool showPlayButton;
  final bool showVideoActions;
  final FeedIndexItem? video;

  @override
  State<HYBilibiliControls> createState() => _HYBilibiliControlsState();
}

class _HYBilibiliControlsState extends State<HYBilibiliControls>
    with SingleTickerProviderStateMixin {
  late PlayerNotifier notifier;

  ///判断当前视频播放状态
  late VideoPlayerValue _latestValue;
  Timer? _hideTimer;
  Timer? _initTimer;
  Timer? _showAfterExpandCollapseTimer;
  bool _dragging = false;
  bool _displayTapped = false;

  final barHeight = 70.h;

  late VideoPlayerController controller;
  ChewieController? _chewieController;

  ChewieController get chewieController => _chewieController!;

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  List<_TaskInfo>? _tasks;
  late List<_ItemHolder> _items;
  late bool _isLoading;
  late bool _permissionReady;
  late String _localPath;
  final ReceivePort _port = ReceivePort();
  final _videos = [];

  @override
  void initState() {
    ///视频数据
    var video = {
      'name': widget.video?.title,
      'link': widget.video?.videoData,
    };
    _videos.add(video);

    notifier = Provider.of<PlayerNotifier>(context, listen: false);

    ///推送初始化
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = const IOSInitializationSettings();
    var initSettings = InitializationSettings(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin.initialize(initSettings);

    ///缓存初始化
    _bindBackgroundIsolate();
    FlutterDownloader.registerCallback(downloadCallback);
    _isLoading = true;
    _permissionReady = false;
    _prepare();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///视频播放错误
    if (_latestValue.hasError) {
      return chewieController.errorBuilder?.call(
            context,
            chewieController.videoPlayerController.value.errorDescription!,
          ) ??
          Container(
            height: double.infinity,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image/icon/loading_video_failed.png",
                  width: 90.w,
                  height: 90.h,
                ),
                20.horizontalSpace,
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          HYAppTheme.norMainThemeColors),
                    ),
                    onPressed: () {
                      setState(() {
                        ///有网络时播放视频
                      });
                    },
                    child: Text(
                      "刷新一下",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp),
                    ))
              ],
            ),
          );
    }

    ///MouseRegion检测鼠标移入移出
    return MouseRegion(
      ///鼠标在区域内移动时的回调
      onHover: (_) {
        _cancelAndRestartTimer();

        ///显示顶部状态栏
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
        _cancelAndRestartTimer();
      },
      child: GestureDetector(
        onTap: () {
          _cancelAndRestartTimer();

          ///显示顶部状态栏
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
              overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
          _cancelAndRestartTimer();
        },
        onDoubleTap: () {
          print("onDoubleTap");
        },
        child: AbsorbPointer(
          absorbing: notifier.hideStuff,
          child: Stack(
            children: [
              ///在缓冲
              _latestValue.isBuffering
                  ? Center(
                      child: Image.asset(
                        "assets/image/icon/ploading.gif",
                        width: 25.w,
                        height: 25.h,
                      ),
                    )
                  : const Center(),

              ///顶部工具栏&底部工具栏
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child:
                    widget.showVideoActions == true ? _buildActionBar() : Row(),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: barHeight,
                  child: _buildBottomBar(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();
    _dispose();
    super.dispose();
  }

  void _dispose() {
    controller.removeListener(_updateState);
    _hideTimer?.cancel();
    _initTimer?.cancel();
    _showAfterExpandCollapseTimer?.cancel();
  }

  ///当Controller改变时，更新，销毁掉旧的
  @override
  void didChangeDependencies() {
    final _oldController = _chewieController;
    _chewieController = ChewieController.of(context);
    controller = chewieController.videoPlayerController;

    if (_oldController != chewieController) {
      _dispose();
      _initialize();
    }
    super.didChangeDependencies();
  }

  Widget _buildActionBar() {
    return SafeArea(
      child: AnimatedOpacity(
        opacity: notifier.hideStuff ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 250),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(.1),
                Colors.transparent,
              ],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///左上角返回
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildOptionsButton(
                      "assets/image/icon/small_window.png",
                      () {
                        _hideTimer?.cancel();
                        if (_latestValue.isPlaying) {
                          _startHideTimer();
                        }
                      },
                    ),
                    _buildOptionsButton(
                      "assets/image/icon/bplayer_remote.png",
                      () {
                        _hideTimer?.cancel();
                        if (_latestValue.isPlaying) {
                          _startHideTimer();
                        }
                      },
                    ),
                    _buildOptionsButton(
                      "assets/image/icon/video_more.png",
                      () {
                        _hideTimer?.cancel();
                        if (_latestValue.isPlaying) {
                          _startHideTimer();
                        }
                        buildVideoShare();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionsButton(String assets, Function() onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        assets,
        width: 20.w,
        height: 20.h,
      ),
    );
  }

  AnimatedOpacity _buildBottomBar(BuildContext context) {
    final iconColor = Theme.of(context).textTheme.button!.color;

    return AnimatedOpacity(
      opacity: notifier.hideStuff ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: SafeArea(
        bottom: chewieController.isFullScreen,
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
              _buildHitArea(),
              _buildProgressBar(),
              _buildPosition(iconColor),
              _buildExpandButton(),
            ],
          ),
        ),
      ),
    );
  }

  ///全屏按钮
  GestureDetector _buildExpandButton() {
    return GestureDetector(
      onTap: _onExpandCollapse,
      child: AnimatedOpacity(
        opacity: notifier.hideStuff ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: chewieController.isFullScreen
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

  ///暂停的按钮
  Widget _buildHitArea() {
    final bool isFinished = _latestValue.position >= _latestValue.duration;
    final bool showPlayButton =
        widget.showPlayButton && !_dragging && !notifier.hideStuff;

    return GestureDetector(
      onTap: () {
        if (_latestValue.isPlaying) {
          if (_displayTapped) {
            setState(() {
              notifier.hideStuff = true;
            });
          } else {
            _cancelAndRestartTimer();
          }
        } else {
          _playPause();

          setState(() {
            notifier.hideStuff = true;
          });
        }
      },
      child: PlayButton(
        iconColor: Colors.white,
        isFinished: isFinished,
        isPlaying: controller.value.isPlaying,
        show: showPlayButton,
        onPressed: _playPause,
      ),
    );
  }

  ///视频播放的时长及当前位置
  Widget _buildPosition(Color? iconColor) {
    final position = _latestValue.position;
    final duration = _latestValue.duration;

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

  void _cancelAndRestartTimer() {
    _hideTimer?.cancel();
    _startHideTimer();

    setState(() {
      notifier.hideStuff = false;
      _displayTapped = true;
    });
  }

  Future<void> _initialize() async {
    controller.addListener(_updateState);

    _updateState();

    if (controller.value.isPlaying || chewieController.autoPlay) {
      _startHideTimer();
    }

    if (chewieController.showControlsOnInitialize) {
      _initTimer = Timer(const Duration(milliseconds: 200), () {
        setState(() {
          notifier.hideStuff = false;
        });
      });
    }
  }

  void _onExpandCollapse() {
    setState(() {
      notifier.hideStuff = true;

      chewieController.toggleFullScreen();
      _showAfterExpandCollapseTimer =
          Timer(const Duration(milliseconds: 300), () {
        setState(() {
          _cancelAndRestartTimer();
        });
      });
    });
  }

  void _playPause() {
    final isFinished = _latestValue.position >= _latestValue.duration;

    ///didUpdateWidget与此处对应
    setState(() {
      if (controller.value.isPlaying) {
        notifier.hideStuff = false;
        _hideTimer?.cancel();
        controller.pause();
      } else {
        _cancelAndRestartTimer();

        if (!controller.value.isInitialized) {
          controller.initialize().then((_) {
            controller.play();
          });
        } else {
          if (isFinished) {
            controller.seekTo(Duration.zero);
          }
          controller.play();
        }
      }
    });
  }

  void _startHideTimer() {
    final hideControlsTimer = chewieController.hideControlsTimer.isNegative
        ? ChewieController.defaultHideControlsTimer
        : chewieController.hideControlsTimer;

    ///过一段时间隐藏掉
    _hideTimer = Timer(hideControlsTimer, () {
      setState(() {
        notifier.hideStuff = true;

        ///不隐藏了
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
        // ///隐藏顶部状态栏
        // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        //     overlays: [SystemUiOverlay.bottom]);
      });
    });
  }

  void _updateState() {
    if (!mounted) return;
    setState(() {
      _latestValue = controller.value;
    });
  }

  ///进度条
  Widget _buildProgressBar() {
    return Expanded(
      child: MaterialVideoProgressBar(
        controller,

        ///在拖拽
        onDragStart: () {
          setState(() {
            _dragging = true;
          });

          _hideTimer?.cancel();
        },
        onDragEnd: () {
          setState(() {
            _dragging = false;
          });

          _startHideTimer();
        },
        colors: chewieController.materialProgressColors ??
            ChewieProgressColors(
              playedColor: HYAppTheme.norMainThemeColors,
              handleColor: const Color.fromRGBO(255, 255, 255, 1),
              bufferedColor: const Color.fromRGBO(255, 255, 255, .6),
              backgroundColor: const Color.fromRGBO(255, 255, 255, .3),
            ),
      ),
    );
  }

  ///视频分享
  Widget buildShareButton(String img, String text) {
    return Container(
      padding: const EdgeInsets.only(right: 10, top: 5).r,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: AssetImage(img),
          ),
          15.verticalSpace,
          Text(
            text,
            style: TextStyle(
              color: HYAppTheme.norGrayColor,
              fontSize: 12.sp,
            ),
          )
        ],
      ),
    );
  }

  ///视频分享
  void buildVideoShare() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 20.w,
                top: 15.h,
              ),
              color: Theme.of(context).canvasColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "分享",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  SizedBox(
                    height: 90.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildShareButton(
                          ImageAssets.biliSocializeWxChatPNG,
                          "微信",
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeWxMomentPNG,
                          "朋友圈",
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeGenericPNG,
                          "下载分享",
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeQqChatPNG,
                          "QQ",
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeQqZonePNG,
                          "QQ空间",
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeDynamicPNG,
                          "动态",
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeGenericPNG,
                          "消息",
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeGenericPNG,
                          "图片分享",
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeGenericPNG,
                          "标记点分享",
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeCopyPNG,
                          "复制链接",
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeGenericPNG,
                          "更多",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 90.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildShareButton(
                          ImageAssets.biliSocializeGenericPNG,
                          "稍后再看",
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            buildDownloadCache();
                          },
                          child: buildShareButton(
                              ImageAssets.biliSocializeGenericPNG, "缓存"),
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeGenericPNG,
                          "倍速播放",
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeGenericPNG,
                          "播放设置",
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeGenericPNG,
                          "听视频",
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeGenericPNG,
                          "后台播放",
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeGenericPNG,
                          "笔记",
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeGenericPNG,
                          "举报",
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeGenericPNG,
                          "我不想看",
                        ),
                        buildShareButton(
                          ImageAssets.biliSocializeGenericPNG,
                          "播放反馈",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                height: 40.h,
                width: double.infinity,
                child: const Text(
                  "取消",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        );
      },
      constraints: BoxConstraints(maxHeight: 300.h),
    );
  }

  ///下载缓存
  void buildDownloadCache() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "下载缓存",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    Icon(
                      Icons.close,
                      size: 15.sp,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: BorderDirectional(
                      top: BorderSide(
                        color: HYAppTheme.norGrayColor,
                        width: .5,
                      ),
                      bottom: BorderSide(
                          color: HYAppTheme.norGrayColor, width: .5)),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5).r,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "当前画质：",
                          style: TextStyle(
                            color: HYAppTheme.norGrayColor,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          "720高清",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                          ),
                        ),
                        5.horizontalSpace,
                        Image.asset(
                          ImageAssets.icArrowUpPNG,
                          width: 10.w,
                          height: 10.h,
                        ),
                      ],
                    ),
                    15.verticalSpace,
                    Container(
                      padding: const EdgeInsets.all(10).r,
                      height: 40.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Text(
                            "8K大会员",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                          30.horizontalSpace,
                          Text(
                            "4K大会员",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                          30.horizontalSpace,
                          Text(
                            "1080P高清",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                          30.horizontalSpace,
                          Text(
                            "720P高清",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                          30.horizontalSpace,
                          Text(
                            "480P高清",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                          30.horizontalSpace,
                          Text(
                            "360P高清",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                          30.horizontalSpace,
                        ],
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        return SizedBox(
                          height: 150.h,
                          child: _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: HYAppTheme.norMainThemeColors,
                                  ),
                                )
                              : _permissionReady
                                  ? _buildDownloadList()
                                  : _buildNoPermissionWarning(),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "缓存全部",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp),
                    ),
                    Container(
                      height: 25.h,
                      width: .5.w,
                      padding: const EdgeInsets.symmetric(vertical: 5).r,
                      color: HYAppTheme.norGrayColor,
                    ),
                    GestureDetector(
                      onTap: () async {
                        // Navigator.of(context).pushNamed(HYOfflineCacheScreen.routeName ,arguments: _localPath);
                        // Stream<FileSystemEntity> fileList = Directory(_localPath).list();
                        // fileList.listen((event) {
                        //   print('$event');
                        //   FileSystemEntityType type =
                        //   FileSystemEntity.typeSync(event.path);
                        //   print('$type');
                        // });
                        ///这里缓存视频都缓存到下载这儿去了，没权限
                        Stream<FileSystemEntity> fileList =
                            Directory("/storage/emulated/0/Download").list();
                        fileList.listen((event) {
                          // print('$event--${event.runtimeType}}--');
                          FileSystemEntityType type =
                              FileSystemEntity.typeSync(event.path);
                          // print('$type');
                        });
                      },
                      child: Text(
                        "查看缓存",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
        constraints: BoxConstraints(maxHeight: 350.h));
  }

  Widget _buildNoPermissionWarning() => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24).r,
              child: const Text(
                'Please grant accessing storage permission to continue -_-',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueGrey, fontSize: 18.0),
              ),
            ),
            32.verticalSpace,
            TextButton(
                onPressed: () {
                  _retryRequestPermission();
                },
                child: Text(
                  'Retry',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ))
          ],
        ),
      );

  Widget _buildDownloadList() {
    return ListView(
      children: _items.map((item) {
        return DownloadItem(
          data: item,
          onItemClick: (task) {
            _openDownloadedFile(task).then((success) {
              if (!success) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Cannot open this file')));
              }
            });
          },
          onActionClick: (task) {
            if (task.status == DownloadTaskStatus.undefined) {
              _requestDownload(task);
            } else if (task.status == DownloadTaskStatus.running) {
              _pauseDownload(task);
            } else if (task.status == DownloadTaskStatus.paused) {
              _resumeDownload(task);
            } else if (task.status == DownloadTaskStatus.complete) {
              _delete(task);
            } else if (task.status == DownloadTaskStatus.failed) {
              _retryDownload(task);
            }
          },
        );
      }).toList(),
    );
  }

  Future<void> _retryRequestPermission() async {
    final hasGranted = await _checkPermission();

    if (hasGranted) {
      await _prepareSaveDir();
    }

    setState(() {
      _permissionReady = hasGranted;
    });
  }

  void _requestDownload(_TaskInfo task) async {
    task.taskId = await FlutterDownloader.enqueue(
      fileName: task.name,
      url: task.link!,
      headers: {"auth": "test_for_sql_encoding"},
      savedDir: _localPath,
      showNotification: true,
      openFileFromNotification: true,
      saveInPublicStorage: true,
    );
  }

  void _pauseDownload(_TaskInfo task) async {
    await FlutterDownloader.pause(taskId: task.taskId!);
  }

  void _resumeDownload(_TaskInfo task) async {
    String? newTaskId = await FlutterDownloader.resume(taskId: task.taskId!);
    task.taskId = newTaskId;
  }

  void _retryDownload(_TaskInfo task) async {
    String? newTaskId = await FlutterDownloader.retry(taskId: task.taskId!);
    task.taskId = newTaskId;
  }

  Future<bool> _openDownloadedFile(_TaskInfo? task) {
    if (task != null) {
      return FlutterDownloader.open(taskId: task.taskId!);
    } else {
      return Future.value(false);
    }
  }

  void _delete(_TaskInfo task) async {
    await FlutterDownloader.remove(
        taskId: task.taskId!, shouldDeleteContent: true);
    await _prepare();
    setState(() {});
  }

  Future<bool> _checkPermission() async {
    if (Platform.isIOS) return true;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final platform = Theme.of(context).platform;
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (platform == TargetPlatform.android) {
      final statusStorage = await Permission.storage.status;
      // final statusManageStorage = await Permission.manageExternalStorage.status;
      if (statusStorage != PermissionStatus.granted) {
        final resultStorage = await Permission.storage.request();
        // final resultManageExternalStorage =
        //     await Permission.manageExternalStorage.request();
        if (resultStorage == PermissionStatus.granted) {
          return true;
        } else {
          return false;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  // ///发送本地推送
  // void send(String title, String body) {
  //   // 构建描述
  //   var androidDetails = const AndroidNotificationDetails('id描述', '名称描述',
  //       importance: Importance.max, priority: Priority.high);
  //   var iosDetails = const IOSNotificationDetails();
  //   var details = NotificationDetails(android: androidDetails, iOS: iosDetails);
  //
  //   // 显示通知, 第一个参数是id,id如果一致则会覆盖之前的通知
  //   flutterLocalNotificationsPlugin.show(
  //       DateTime.now().millisecondsSinceEpoch >> 10, title, body, details);
  // }

  void _bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) {
      if (debug) {
        print('UI Isolate Callback: $data');
      }
      String? id = data[0];
      DownloadTaskStatus? status = data[1];
      int? progress = data[2];

      if (_tasks != null && _tasks!.isNotEmpty) {
        final task = _tasks!.firstWhere((task) => task.taskId == id);
        setState(() {
          task.status = status;
          task.progress = progress;
        });
      }
    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    if (debug) {
      print(
          'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    }
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  Future<void> _prepare() async {
    ///加载所有下载任务
    final tasks = await FlutterDownloader.loadTasks();

    int count = 0;
    _tasks = [];
    _items = [];

    _tasks!.addAll(_videos
        .map((video) => _TaskInfo(name: video['name'], link: video['link'])));

    for (int i = count; i < _tasks!.length; i++) {
      _items.add(_ItemHolder(name: _tasks![i].name, task: _tasks![i]));
      count++;
    }

    for (var task in tasks!) {
      for (_TaskInfo info in _tasks!) {
        if (info.link == task.url) {
          info.taskId = task.taskId;
          info.status = task.status;
          info.progress = task.progress;
        }
      }
    }

    _permissionReady = await _checkPermission();

    if (_permissionReady) {
      await _prepareSaveDir();
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath())! + "/bilibili_download";
    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<String?> _findLocalPath() async {
    String? externalStorageDirPath;
    if (Platform.isAndroid) {
      final directory = await getExternalStorageDirectory();
      externalStorageDirPath = directory?.path;
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
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

String formatDuration(Duration position) {
  final ms = position.inMilliseconds;

  int seconds = ms ~/ 1000;
  final int hours = seconds ~/ 3600;
  seconds = seconds % 3600;
  final minutes = seconds ~/ 60;
  seconds = seconds % 60;

  final hoursString = hours >= 10
      ? '$hours'
      : hours == 0
          ? '00'
          : '0$hours';

  final minutesString = minutes >= 10
      ? '$minutes'
      : minutes == 0
          ? '00'
          : '0$minutes';

  final secondsString = seconds >= 10
      ? '$seconds'
      : seconds == 0
          ? '00'
          : '0$seconds';

  final formattedTime =
      '${hoursString == '00' ? '' : '$hoursString:'}$minutesString:$secondsString';

  return formattedTime;
}

class MaterialVideoProgressBar extends StatelessWidget {
  MaterialVideoProgressBar(
    this.controller, {
    this.height = kToolbarHeight,
    ChewieProgressColors? colors,
    this.onDragEnd,
    this.onDragStart,
    this.onDragUpdate,
    Key? key,
  })  : colors = colors ?? ChewieProgressColors(),
        super(key: key);

  final double height;
  final VideoPlayerController controller;
  final ChewieProgressColors colors;
  final Function()? onDragStart;
  final Function()? onDragEnd;
  final Function()? onDragUpdate;

  @override
  Widget build(BuildContext context) {
    return VideoProgressBar(
      controller,
      barHeight: 3.h,
      handleHeight: 2.h,
      drawShadow: true,
      colors: colors,
      onDragEnd: onDragEnd,
      onDragStart: onDragStart,
      onDragUpdate: onDragUpdate,
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
class VideoProgressBar extends StatefulWidget {
  VideoProgressBar(
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
  _VideoProgressBarState createState() {
    return _VideoProgressBarState();
  }
}

class _VideoProgressBarState extends State<VideoProgressBar> {
  // ///进度条顶端图片
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

class _TaskInfo {
  final String? name;
  final String? link;

  String? taskId;
  int? progress = 0;
  DownloadTaskStatus? status = DownloadTaskStatus.undefined;

  _TaskInfo({this.name, this.link});
}

class _ItemHolder {
  final String? name;
  final _TaskInfo? task;

  _ItemHolder({this.name, this.task});
}

class DownloadItem extends StatefulWidget {
  final _ItemHolder? data;
  final Function(_TaskInfo?)? onItemClick;
  final Function(_TaskInfo)? onActionClick;

  DownloadItem({this.data, this.onItemClick, this.onActionClick});

  @override
  State<DownloadItem> createState() => _DownloadItemState();
}

class _DownloadItemState extends State<DownloadItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.data?.task?.status == DownloadTaskStatus.complete) {
          SmartDialog.showToast("视频已经缓存完成~");
          widget.onItemClick!(widget.data!.task);
        } else if (widget.data?.task?.status == DownloadTaskStatus.running) {
          SmartDialog.showToast("该视频已经添加至正在缓存列表~");
        } else {
          widget.onActionClick!(widget.data!.task!);
        }
        if (mounted) setState(() {});
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(
              widget.data!.name!,
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: HYAppTheme.norMainThemeColors,
                fontSize: 16.sp,
              ),
            ),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8).r,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3.r)),
              border: Border.all(color: HYAppTheme.norMainThemeColors),
            ),
          ),
          Positioned(
            child: _buildActionForTask(widget.data!.task!),
            bottom: 0,
            right: 2.w,
          ),
        ],
      ),
    );
  }

  Widget _buildActionForTask(_TaskInfo task) {
    if (task.status == DownloadTaskStatus.paused) {
      return CircleAvatar(
        radius: 7.r,
        backgroundImage: AssetImage(ImageAssets.icVideoDownloadStopPNG),
      );
    } else if (task.status == DownloadTaskStatus.complete) {
      return CircleAvatar(
        radius: 7.r,
        backgroundImage: AssetImage(ImageAssets.icVideoDownloadCompletePNG),
      );
    } else if (task.status == DownloadTaskStatus.canceled) {
      return Container();
    } else if (task.status == DownloadTaskStatus.failed) {
      return CircleAvatar(
        radius: 7.r,
        backgroundImage: AssetImage(ImageAssets.icVideoDownloadErrorPNG),
      );
    } else if (task.status == DownloadTaskStatus.enqueued) {
      return Container();
    } else if (task.status == DownloadTaskStatus.running) {
      return CircleAvatar(
        radius: 7.r,
        backgroundImage: AssetImage(ImageAssets.icVideoDownloadProcessingPNG),
      );
    } else if (task.status == DownloadTaskStatus.undefined) {
      return Container();
    } else {
      return Container();
    }
  }
}
