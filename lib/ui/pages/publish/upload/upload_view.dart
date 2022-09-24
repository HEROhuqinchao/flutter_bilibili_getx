import 'dart:io';
import 'dart:typed_data';

import 'package:bilibili_getx/core/I18n/str_res_keys.dart';
import 'package:bilibili_getx/ui/pages/video_play/bilibili_video_player/bilibili_video_player_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../../../shared/app_theme.dart';
import '../../../shared/image_asset.dart';
import '../../../shared/math_compute.dart';
import 'local_image/local_image_view.dart';
import 'local_video/local_video_view.dart';
import 'upload_logic.dart';



class UploadView extends StatefulWidget {
  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView>
    with SingleTickerProviderStateMixin {
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
    return GetBuilder<UploadLogic>(builder: (logic) {
      return Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 60, left: 20, right: 20).r,
                height: 350.h,
                width: 1.sw,
                child: buildUploadFilePreview(),
              ),
              AppBar(
                backgroundColor: Colors.transparent,
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
                actions: buildUpLoadActions(),
              ),
            ],
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    labelColor: HYAppTheme.norWhite01Color,
                    indicatorColor: HYAppTheme.norTextColors,
                    controller: state.tabController,
                    indicatorWeight: 1.h,
                    labelPadding: const EdgeInsets.symmetric(vertical: 2).r,
                    labelStyle: TextStyle(
                      color: HYAppTheme.norWhite01Color,
                      fontWeight: FontWeight.normal,
                      fontSize: 13.sp,
                      fontFamily: 'bilibiliFonts',
                    ),
                    tabs: [
                      Tab(text: SR.video.tr),
                      Tab(text: SR.photo.tr),
                      Tab(text: SR.file.tr)
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: state.tabController,
                      children: [
                        LocalVideoComponent(),
                        LocalImageComponent(),
                        buildUploadFiles()
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );
    });
  }

  Widget buildUploadFilePreview() {
    if(state.fileType == 0) {
      ///视频文件
      return const BilibiliVideoPlayerComponent();
    } else if(state.fileType == 1){
      ///图片文件
      return Image.file(
        File(state.fileSrc),
        fit: BoxFit.contain,
      );
    } else {
      ///文件类型
      return Center(
        child: Text("文件类型"),
      );
    }
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


  ///编辑视频、草稿箱
  List<Widget> buildUpLoadActions() {
    return [
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 20).r,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.r))),
        child: Text(
          SR.editVideo.tr,
          style: TextStyle(
            color: HYAppTheme.norWhite01Color,
            fontSize: 14.sp,
          ),
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 20).r,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.r))),
        child: Text(
          SR.script.tr,
          style: TextStyle(
            color: HYAppTheme.norWhite01Color,
            fontSize: 14.sp,
          ),
        ),
      )
    ];
  }

}
