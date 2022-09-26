import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/widgets/row_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/I18n/str_res_keys.dart';
import 'pre_publish_video_logic.dart';

class PrePublishVideoView extends StatelessWidget {
  static String routeName = "/pre_publish_video";
  final logic = Get.find<PrePublishVideoLogic>();
  final state = Get.find<PrePublishVideoLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPrePublishVideoAppBar(),
      bottomSheet: buildPrePublishVideoBottomSheet(),
      body: buildPrePublishVideoBody(),
    );
  }

  ///主要内容
  Widget buildPrePublishVideoBody() {
    return SingleChildScrollView(
      child: Container(
        color: HYAppTheme.norWhite01Color,
        padding: EdgeInsets.all(10.r),
        child: Column(
          children: [
            buildPreBuildVideoBodyHeader(),
            Divider(),
            BilibiliRowButton(
              title: TextSpan(
                text: "分区和标签",
                style:
                    TextStyle(color: HYAppTheme.norTextColors, fontSize: 14.sp),
              ),
              tabEvent: () {},
              fillTypeWidget: TextSpan(
                text: "（必填）",
                style:
                    TextStyle(color: HYAppTheme.norGrayColor, fontSize: 12.sp),
              ),
            ),
            BilibiliRowButton(
              title: TextSpan(
                text: "稿件类型",
                style:
                    TextStyle(color: HYAppTheme.norTextColors, fontSize: 14.sp),
              ),
              tabEvent: () {},
              fillTypeWidget: TextSpan(
                text: "（必填）",
                style:
                    TextStyle(color: HYAppTheme.norGrayColor, fontSize: 12.sp),
              ),
              rightWidget: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 20.sp,
                    child: Checkbox(
                      value: false,
                      onChanged: (value) {},
                      shape: const CircleBorder(),
                    ),
                  ),
                  Container(
                    height: 15.sp,
                    child: Text(
                      "自制",
                      style: TextStyle(
                          color: HYAppTheme.norGrayColor, fontSize: 12.sp),
                    ),
                  ),
                  5.horizontalSpace,
                  Container(
                    height: 20.sp,
                    child: Checkbox(
                      value: false,
                      onChanged: (value) {},
                      shape: const CircleBorder(),
                    ),
                  ),
                  Container(
                    height: 15.sp,
                    child: Text(
                      "转载",
                      style: TextStyle(
                          color: HYAppTheme.norGrayColor, fontSize: 12.sp),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            BilibiliRowButton(
              title: TextSpan(
                text: "简介",
                style:
                    TextStyle(color: HYAppTheme.norTextColors, fontSize: 14.sp),
              ),
              tabEvent: () {},
            ),
            BilibiliRowButton(
              title: TextSpan(
                text: "发布设置",
                style:
                    TextStyle(color: HYAppTheme.norTextColors, fontSize: 14.sp),
              ),
              tabEvent: () {},
            ),
            Divider(),
            BilibiliRowButton(
              title: TextSpan(
                text: "动态",
                style:
                    TextStyle(color: HYAppTheme.norTextColors, fontSize: 14.sp),
              ),
              tabEvent: () {},
            )
          ],
        ),
      ),
    );
  }

  ///视频及标题
  Widget buildPreBuildVideoBodyHeader() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          width: 150.w,
          height: 75.w,
          child: Text("视频文件"),
        ),
        10.horizontalSpace,
        Expanded(
          child: TextField(
            maxLength: 80,
            maxLines: 6,
            decoration: InputDecoration(
                filled: true,
                fillColor: HYAppTheme.norWhite01Color,
                border: InputBorder.none,
                hintText: "请输入标题（必填）",
                hintStyle: TextStyle(
                  color: HYAppTheme.norGrayColor,
                  fontSize: 12.sp,
                )),
          ),
        ),
      ],
    );
  }

  Widget buildPrePublishVideoRowButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "分区和标签",
                style:
                    TextStyle(color: HYAppTheme.norTextColors, fontSize: 12.sp),
              ),
              TextSpan(
                text: "（必填）",
                style:
                    TextStyle(color: HYAppTheme.norGrayColor, fontSize: 10.sp),
              )
            ],
          ),
        ),
        Icon(
          Icons.chevron_right,
          color: HYAppTheme.norGrayColor,
          size: 12.sp,
        )
      ],
    );
  }

  ///底部内容
  Widget buildPrePublishVideoBottomSheet() {
    return Container(
      width: 1.sw,
      color: HYAppTheme.norWhite01Color,
      padding: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
                shape: const CircleBorder(),
              ),
              Text(
                SR.iHaveReadAndAccept.tr,
                style: TextStyle(
                  color: HYAppTheme.norTextColors,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                SR.blibiliCreativePolicy.tr,
                style: TextStyle(
                  color: HYAppTheme.norMainThemeColors,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                width: .25.sw,
                padding: EdgeInsets.symmetric(vertical: 10.r),
                decoration: BoxDecoration(
                    border: Border.all(color: HYAppTheme.norGrayColor),
                    color: HYAppTheme.norWhite01Color,
                    borderRadius: BorderRadius.all(Radius.circular(20.r))),
                child: Text(
                  SR.saveScript.tr,
                  style: TextStyle(
                    color: HYAppTheme.norTextColors,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: .65.sw,
                padding: EdgeInsets.symmetric(vertical: 10.r),
                decoration: BoxDecoration(
                    color: HYAppTheme.norMainThemeColors,
                    borderRadius: BorderRadius.all(Radius.circular(20.r))),
                child: Text(
                  SR.publish.tr,
                  style: TextStyle(
                    color: HYAppTheme.norTextColors,
                    fontSize: 15.sp,
                  ),
                ),
              )
            ],
          ),
          10.verticalSpace,
          Text(
            SR.prePublishDesc.tr,
            style: TextStyle(
              color: HYAppTheme.norGrayColor,
              fontSize: 12.sp,
            ),
          )
        ],
      ),
    );
  }

  ///标题栏
  PreferredSizeWidget buildPrePublishVideoAppBar() {
    return AppBar(
      elevation: .8,
      backgroundColor: HYAppTheme.norWhite01Color,
      leading: const Icon(
        Icons.arrow_back,
        color: HYAppTheme.norTextColors,
      ),
      title: Text(
        SR.publishVideo.tr,
        style: TextStyle(
          fontSize: 14.sp,
          color: HYAppTheme.norTextColors,
        ),
      ),
      centerTitle: true,
    );
  }
}
