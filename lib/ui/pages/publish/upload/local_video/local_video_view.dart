import 'dart:typed_data';

import 'package:bilibili_getx/ui/pages/video_play/bilibili_video_player/bilibili_video_player_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../../shared/app_theme.dart';
import '../../../../shared/image_asset.dart';
import '../../../../shared/math_compute.dart';
import '../../../video_play/bilibili_video_player/bilibili_video_player_logic.dart';
import '../pre_edit_video/pre_edit_video_view.dart';
import 'local_video_logic.dart';

class LocalVideoComponent extends StatefulWidget {
  @override
  State<LocalVideoComponent> createState() => _LocalVideoComponentState();
}

class _LocalVideoComponentState extends State<LocalVideoComponent>
    with AutomaticKeepAliveClientMixin {
  final logic = Get.put(LocalVideoLogic());
  final state = Get.find<LocalVideoLogic>().state;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<LocalVideoLogic>(builder: (logic) {
      return state.localVideoList.isNotEmpty
          ? GridView.builder(
              itemCount: state.localVideoList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 5.w,
                mainAxisSpacing: 5.h,
                crossAxisCount: 3,
              ),
              itemBuilder: (ctx, index) {
                return FutureBuilder(
                  future:
                      getVideoCover(state.localVideoList[index].videoLocation),
                  builder: (ctx, AsyncSnapshot<Uint8List?> snapshot) {
                    return GestureDetector(
                      onTap: () {
                        Get.put(BilibiliVideoPlayerLogic());
                        BilibiliVideoPlayerState bilibiliVideoPlayerState = Get.find<BilibiliVideoPlayerLogic>().state;
                        bilibiliVideoPlayerState.haveFinishView = false;
                        bilibiliVideoPlayerState.haveFullScreenFunction = false;
                        bilibiliVideoPlayerState.haveDanMuFunction = false;
                        bilibiliVideoPlayerState.videoOriginalUrl = state.localVideoList[index].videoLocation;

                        BilibiliVideoPlayerLogic bilibiliVideoPlayerLogic = Get.find<BilibiliVideoPlayerLogic>();
                        bilibiliVideoPlayerLogic.initVideoPlayerVideoData();
                        bilibiliVideoPlayerLogic.initVideoControllerAndDanMuController();

                        Get.toNamed(PreEditVideoView.routeName);
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
                                    changeToDurationText(double.parse(state
                                            .localVideoList[index].duration) /
                                        1000.0),
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: HYAppTheme.norWhite01Color,
                                        fontSize: 14.sp),
                                  ),
                                ),
                              ],
                            )
                          : Container(
                              alignment: Alignment.center,
                              child: Text(
                                "加载中",
                                style: TextStyle(
                                  color: HYAppTheme.norWhite01Color,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal
                                ),
                              ),
                            ),
                    );
                  },
                );
              },
            )
          : Center(
              child: Text(
                "啥也么有",
                style: TextStyle(
                    color: HYAppTheme.norWhite01Color, fontSize: 14.sp),
              ),
            );
    });
  }

  ///获取视频封面
  Future<Uint8List?> getVideoCover(path) async {
    Uint8List? uint8list = await VideoThumbnail.thumbnailData(
      video: path,
      imageFormat: ImageFormat.PNG,
      // maxWidth: 128,

      ///图片质量
      quality: 1,
    );
    return uint8list;
  }

  @override
  bool get wantKeepAlive => true;
}
