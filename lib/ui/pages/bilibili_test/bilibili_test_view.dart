import 'package:bilibili_getx/core/model/android/video_play/download_video_model.dart';
import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'bilibili_test_logic.dart';

///只用于测试的界面!!!!
///到main.dart切换初始路由
class BilibiliTestScreen extends StatelessWidget {
  final logic = Get.find<BilibiliTestLogic>();
  final state = Get.find<BilibiliTestLogic>().state;
  static String routeName = "/test";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BilibiliTestLogic>(builder: (logic) {
      return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(onPressed: () {
          ///初始化下载列表
          logic.iniDownloadList();
        }),
        body: Center(
          child: state.downloadVideoList.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
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
                          SmartDialog.showToast("已下载");
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.r, horizontal: 10.r),
                        margin: EdgeInsets.symmetric(
                            vertical: 8.r, horizontal: 13.r),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HYAppTheme.norMainThemeColors,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.r))),
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
                                    color: HYAppTheme.norMainThemeColors
                                        .withOpacity(.7),
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
                                "${(state.downloadVideoList[index].progress * 100).toInt()}%"),
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
                )
              : Container(),
        ),
      );
    });
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
