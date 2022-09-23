import 'dart:io';
import 'dart:typed_data';

import 'package:bilibili_getx/core/I18n/str_res_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../../../shared/app_theme.dart';
import '../../../shared/image_asset.dart';
import '../../../shared/math_compute.dart';
import 'upload_logic.dart';

class UploadScreen extends StatefulWidget {
  static String routeName = "/upload";

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final logic = Get.find<UploadLogic>();
  final state = Get.find<UploadLogic>().state;

  @override
  void initState() {
    ///监听TabBar和TabBarView，两个都要加，一个是点击，一个是左右滑动监听
    state.tabController = TabController(vsync: this, length: 3);
    state.tabController.addListener(() {
      logic.updateTabName();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding:
              const EdgeInsets.only(top: 60, left: 20, right: 20).r,
              // width: MediaQuery.of(context).size.width - 20.w,
              height: 350.h,
              // child: state.upLoadFileType == 0
              //     ? HYChewieWidget(state
              //         .localVideoList[state.currentVideoIndex]
              //         .videoLocation)
              //     : Image.file(
              //         File(state.imageCache),
              //         fit: BoxFit.contain,
              //       ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
              actions: [
                buildUpLoadAction("编辑视频"),
                buildUpLoadAction("草稿箱"),
              ],
            ),
          ],
        ),
        Expanded(
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.white,
                  indicatorColor: HYAppTheme.norTextColors,
                  controller: state.tabController,
                  tabs: const [
                    Tab(text: SR.video),
                    Tab(text: SR.photo),
                    Tab(text: SR.file)
                  ],
                ),
                Expanded(
                    child: TabBarView(
                      controller: state.tabController,
                      children: [
                        state.localVideoList.isNotEmpty ? buildUploadVideo() : Container(),
                        state.localImageList.isNotEmpty ? buildUploadImage() : Container(),
                        buildUploadFiles()
                      ],
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }

  ///加载手机内视频内容
  Widget buildUploadVideo() {
    return GridView.builder(
      itemCount: state.localVideoList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 5.w,
        mainAxisSpacing: 5.h,
        crossAxisCount: 3,
      ),
      itemBuilder: (ctx, index) {
        return FutureBuilder(
          future: getVideoCover(state.localVideoList[index].videoLocation),
          builder: (ctx, AsyncSnapshot<Uint8List?> snapshot) {
            return GestureDetector(
              onTap: () {
                // ///点击视频播放视频
                // state.currentVideoIndex = index;
                // update();
              },
              child: snapshot.data != null
                  ? Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.memory(
                      snapshot.data!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 5.w,
                    top: 5.h,
                    child: Image.asset(
                      ImageAssets.roundAddPNG,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                  Positioned(
                    bottom: 8.h,
                    right: 8.w,
                    child: Text(
                      ///此处要转换单位除以1000变为秒
                      changeToDurationText(double.parse(
                          state.localVideoList[index].duration) /
                          1000.0),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: HYAppTheme.norWhite01Color,
                          fontSize: 14.sp),
                    ),
                  ),
                ],
              )
                  : Container(
                color: HYAppTheme.norTextColors,
              ),
            );
          },
        );
      },
    );
  }

  ///加载手机内图片内容
  Widget buildUploadImage() {
    return GridView.builder(
      itemCount: state.localImageList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 5.w,
        mainAxisSpacing: 5.h,
        crossAxisCount: 3,
      ),
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            // state.imageCache = state.localImageList[index].imageLocation;
            // update();
          },
          child: Image.file(
            File(state.localImageList[index].imageLocation),
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  ///加载手机内文件夹内容
  Widget buildUploadFiles() {
    return const Center(
      child: Text(
        "文件夹，待写",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  ///获取视频封面
  Future<Uint8List?> getVideoCover(path) async {
    Uint8List? uint8list = await VideoThumbnail.thumbnailData(
      video: path,
      imageFormat: ImageFormat.PNG,
      // maxWidth: 128,

      ///图片质量
      quality: 10,
    );
    return uint8list;
  }

  ///编辑视频、草稿箱
  Widget buildUpLoadAction(String text) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(right: 20).r,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30.r))),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// class HYChewieWidget extends StatefulWidget {
//   ///视频URL
//   String url;
//
//   HYChewieWidget(this.url, {Key? key}) : super(key: key);
//
//   @override
//   State<HYChewieWidget> createState() => _HYChewieWidgetState();
// }
//
// class _HYChewieWidgetState extends State<HYChewieWidget> {
//   ///视频播放
//   late VideoPlayerController _videoPlayerController;
//   late ChewieController _chewieController;
//
//   ///是否加载视频完成
//   bool isLoadingAccomplished = false;
//
//   @override
//   void initState() {
//     ///初始化Controller
//     _videoPlayerController = VideoPlayerController.file(
//       File(widget.url),
//     );
//
//     ///这里的.initialize().then作用是为了能获取视频的原始比例，而不会把视频的高度压缩
//     _videoPlayerController.initialize().then((value) {
//       _chewieController = ChewieController(
//         allowMuting: false,
//         videoPlayerController: _videoPlayerController,
//         autoPlay: false,
//         customControls: const HYBilibiliControls(
//           showVideoActions: false,
//           video: null,
//         ),
//       );
//       isLoadingAccomplished = true;
//       if (mounted) {
//         setState(() {});
//       }
//     });
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return isLoadingAccomplished == true
//         ? Container(
//       padding: EdgeInsets.zero,
//       color: HYAppTheme.norTextColors,
//       alignment: Alignment.topCenter,
//       height: width /
//           _chewieController.videoPlayerController.value.aspectRatio,
//       child: Stack(
//         children: [
//           Chewie(
//             controller: _chewieController,
//           ),
//         ],
//       ),
//     )
//         : Container(
//       height: width / 1.77777777777777777,
//       color: HYAppTheme.norTextColors,
//       child: Center(
//         child: SizedBox(
//           width: 40.w,
//           height: 40.h,
//           child: const CircularProgressIndicator(
//             color: HYAppTheme.norMainThemeColors,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _chewieController.dispose();
//     _videoPlayerController.dispose();
//     super.dispose();
//   }
//
//   ///当url发生改变时，注销再创建，
//   ///如果不先注销，必然会内存溢出，多点几个视频，APP就会GG，直接内存爆了
//   @override
//   void didUpdateWidget(covariant HYChewieWidget oldWidget) {
//     if (oldWidget.url != widget.url) {
//       if (widget.url == "") return;
//
//       ///关键几步如下
//       if (_chewieController != null) _chewieController.dispose();
//       if (_videoPlayerController != null) _videoPlayerController.dispose();
//
//       ///初始化视频数据
//       _videoPlayerController = VideoPlayerController.file(
//         File(widget.url),
//       );
//       _videoPlayerController.initialize().then((value) {
//         _chewieController = ChewieController(
//           allowMuting: false,
//           videoPlayerController: _videoPlayerController,
//           autoPlay: true,
//           customControls: const HYBilibiliControls(
//             showVideoActions: false,
//             video: null,
//           ),
//         );
//         isLoadingAccomplished = true;
//         if (mounted) {
//           setState(() {});
//         }
//       });
//     }
//     super.didUpdateWidget(oldWidget);
//   }
// }
