import 'package:bilibili_getx/core/I18n/str_res_keys.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../shared/app_theme.dart';
import '../../../widgets/round_underline_tab_indicator.dart';
import 'local_image/local_image_view.dart';
import 'local_video/local_video_view.dart';
import 'upload_logic.dart';

class UploadView extends StatefulWidget {
  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> with TickerProviderStateMixin {
  final logic = Get.find<UploadLogic>();
  final state = Get.find<UploadLogic>().state;

  @override
  void initState() {
    ///监听TabBar和TabBarView，两个都要加，一个是点击，一个是左右滑动监听
    state.mainTabController = TabController(vsync: this, length: 2);
    state.mainTabController.addListener(() {
      // logic.updateTabName();
    });
    state.subTabController = TabController(vsync: this, length: 3);
    state.subTabController.addListener(() {
      // logic.updateTabName();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadLogic>(builder: (logic) {
      return CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Icon(
              Icons.clear,
              size: 20.sp,
            ),
            backgroundColor: Colors.transparent,
            pinned: true,
            title: buildUpLoadMainTabBar(),
            centerTitle: true,
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: state.mainTabController,
              children: [buildRecentlyFiles(), buildScript()],
            ),
          ),
        ],
      );
    });
  }

  Widget buildScript() {
    return Container(
      child: Text("草稿"),
    );
  }

  Widget buildRecentlyFiles() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          pinned: true,
          title: buildUpLoadSubTabBar(),
          centerTitle: true,
        ),
        SliverFillRemaining(
          child: TabBarView(
            controller: state.subTabController,
            children: [
              Container(
                child: Text("全部"),
              ),
              LocalVideoComponent(),
              LocalImageComponent()
            ],
          ),
        )
      ],
    );
  }

  ///顶部主TabBar
  Widget buildUpLoadMainTabBar() {
    return DefaultTabController(
      length: 2,
      child: TabBar(
        controller: state.mainTabController,
        labelColor: HYAppTheme.norWhite01Color,
        indicator: BilibiliRoundUnderlineTabIndicator(
            insets: EdgeInsets.symmetric(horizontal: 25.r),
            borderSide:
                BorderSide(width: 4.sp, color: HYAppTheme.norWhite01Color)),
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(
          color: HYAppTheme.norWhite01Color,
          fontWeight: FontWeight.normal,
          fontSize: 12.sp,
          fontFamily: 'bilibiliFonts',
        ),
        tabs: [
          Tab(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.sp,
                  child: Text(
                    SR.recentlyProject.tr,
                    style: TextStyle(
                        color: HYAppTheme.norWhite01Color, fontSize: 15.sp),
                  ),
                ),
                SizedBox(
                  height: 13.sp,
                  width: 13.sp,
                  child: Image.asset(ImageAssets.expandedDarkPNG),
                )
              ],
            ),
          ),
          Tab(
            text: SR.script.tr,
          )
        ],
      ),
    );
  }

  Widget buildUpLoadSubTabBar() {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        controller: state.subTabController,
        labelColor: HYAppTheme.norWhite01Color,
        indicator: BilibiliRoundUnderlineTabIndicator(
            borderSide: BorderSide(
                width: 2.sp,
                color: HYAppTheme.norWhite01Color.withOpacity(.5))),
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(
          color: HYAppTheme.norWhite01Color,
          fontWeight: FontWeight.normal,
          fontSize: 12.sp,
          fontFamily: 'bilibiliFonts',
        ),
        tabs: [
          Tab(text: SR.all.tr),
          Tab(text: SR.video.tr),
          Tab(text: SR.photo.tr),
        ],
      ),
    );
  }

// Widget buildUploadFilePreview() {
//   if(state.fileType == 0) {
//     ///视频文件
//     return Container();
//   } else if(state.fileType == 1){
//     ///图片文件
//     return Image.file(
//       File(state.fileSrc),
//       fit: BoxFit.contain,
//     );
//   } else {
//     ///文件类型
//     return Center(
//       child: Text("文件类型"),
//     );
//   }
// }
//
// ///加载手机内文件夹内容
// Widget buildUploadFiles() {
//   return const Center(
//     child: Text(
//       "文件夹，待写",
//       style: TextStyle(color: Colors.white),
//     ),
//   );
// }
//
//
// ///编辑视频、草稿箱
// List<Widget> buildUpLoadActions() {
//   return [
//     Container(
//       alignment: Alignment.center,
//       padding: const EdgeInsets.only(right: 20).r,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(30.r))),
//       child: Text(
//         SR.editVideo.tr,
//         style: TextStyle(
//           color: HYAppTheme.norWhite01Color,
//           fontSize: 14.sp,
//         ),
//       ),
//     ),
//     Container(
//       alignment: Alignment.center,
//       padding: const EdgeInsets.only(right: 20).r,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(30.r))),
//       child: Text(
//         SR.script.tr,
//         style: TextStyle(
//           color: HYAppTheme.norWhite01Color,
//           fontSize: 14.sp,
//         ),
//       ),
//     )
//   ];
// }

}
