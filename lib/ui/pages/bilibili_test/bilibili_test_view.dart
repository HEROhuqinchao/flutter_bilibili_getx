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
          ///创建下载目录
          logic.iniDownloadFilePath();
          ///初始化下载插件
          logic.initFlutterDownloader();

          ///弹出界面
          showVideoShareAndMoreFunctionBottomDialog(context);
        }),
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
                physics: NeverScrollableScrollPhysics(),
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
}
