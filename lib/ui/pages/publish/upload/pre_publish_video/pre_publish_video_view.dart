import 'package:bilibili_getx/ui/pages/publish/upload/bai_du_map_location/bai_du_map_location_view.dart';
import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:bilibili_getx/ui/widgets/custom/pop_route.dart';
import 'package:bilibili_getx/ui/widgets/custom/row_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/I18n/str_res_keys.dart';
import 'pre_publish_video_logic.dart';

class PrePublishVideoScreen extends StatelessWidget {
  static String routeName = "/pre_publish_video";
  final logic = Get.find<PrePublishVideoLogic>();
  final state = Get.find<PrePublishVideoLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrePublishVideoLogic>(builder: (logic) {
      return Scaffold(
        appBar: buildPrePublishVideoAppBar(),
        bottomSheet: buildPrePublishVideoBottomSheet(),
        body: buildPrePublishVideoBody(context),
      );
    });
  }

  ///主要内容
  Widget buildPrePublishVideoBody(context) {
    return SingleChildScrollView(
      child: Container(
        color: HYAppTheme.norWhite01Color,
        padding: EdgeInsets.all(10.r),
        child: Column(
          children: [
            ///标题和视频封面
            buildPreBuildVideoBodyHeader(),
            const Divider(),

            ///分区和标签
            BilibiliRowButton(
              title: TextSpan(
                text: SR.zoneAndLabel.tr,
                style:
                    TextStyle(color: HYAppTheme.norTextColors, fontSize: 14.sp),
              ),
              tabEvent: () {
                Navigator.push(context,
                    PopRoute(child: buildZoneAndTopicEditDialog(context)));
              },
              fillTypeWidget: TextSpan(
                text: "（${SR.mustInput.tr}）",
                style:
                    TextStyle(color: HYAppTheme.norGrayColor, fontSize: 12.sp),
              ),
            ),

            ///稿件和类型
            BilibiliRowButton(
              title: TextSpan(
                text: SR.scriptType.tr,
                style:
                    TextStyle(color: HYAppTheme.norTextColors, fontSize: 14.sp),
              ),
              tabEvent: () {},
              fillTypeWidget: TextSpan(
                text: "（${SR.mustInput.tr}）",
                style:
                    TextStyle(color: HYAppTheme.norGrayColor, fontSize: 12.sp),
              ),
              rightWidget: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  state.selfMade
                      ? isCheckedButton()
                      : GestureDetector(
                          child: unCheckedButton(),
                          onTap: () {
                            logic.checkSelfMade();
                          },
                        ),
                  10.horizontalSpace,
                  Container(
                    alignment: Alignment.center,
                    height: 20.sp,
                    child: Text(
                      SR.selfMade.tr,
                      style: TextStyle(
                          color: HYAppTheme.norGrayColor, fontSize: 12.sp),
                    ),
                  ),
                  15.horizontalSpace,
                  state.transshipment
                      ? isCheckedButton()
                      : GestureDetector(
                          child: unCheckedButton(),
                          onTap: () {
                            logic.checkTransshipment();
                          },
                        ),
                  10.horizontalSpace,
                  Container(
                    alignment: Alignment.center,
                    height: 15.sp,
                    child: Text(
                      SR.transshipment.tr,
                      style: TextStyle(
                          color: HYAppTheme.norGrayColor, fontSize: 12.sp),
                    ),
                  )
                ],
              ),
            ),
            state.selfMade ? buildSelfMadeContent() : Container(),
            state.transshipment ? buildTransshipmentContent() : Container(),
            const Divider(),

            ///简介
            BilibiliRowButton(
              title: TextSpan(
                text: SR.profile.tr,
                style:
                    TextStyle(color: HYAppTheme.norTextColors, fontSize: 14.sp),
              ),
              tabEvent: () {
                Navigator.push(
                    context, PopRoute(child: buildProfileEditDialog(context)));
              },
            ),

            ///发布设置
            BilibiliRowButton(
              title: TextSpan(
                text: SR.publishSetting.tr,
                style:
                    TextStyle(color: HYAppTheme.norTextColors, fontSize: 14.sp),
              ),
              tabEvent: () {
                Navigator.push(context,
                    PopRoute(child: buildPublishSettingEditDialog(context)));
              },
            ),
            const Divider(),

            ///动态
            BilibiliRowButton(
              title: TextSpan(
                text: SR.dynamic.tr,
                style:
                    TextStyle(color: HYAppTheme.norTextColors, fontSize: 14.sp),
              ),
              tabEvent: () {
                Navigator.push(
                    context, PopRoute(child: buildDynamicDialog(context)));
              },
            )
          ],
        ),
      ),
    );
  }

  ///自制说明
  Widget buildSelfMadeContent() {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 15.r),
      decoration: BoxDecoration(
        color: HYAppTheme.norGrayColor.withOpacity(.1),
        borderRadius: BorderRadius.all(Radius.circular(4.r)),
      ),
      child: Wrap(
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: SR.transshipmentPermissions.tr,
                  style: TextStyle(
                      color: HYAppTheme.norTextColors,
                      fontSize: 10.sp,
                      fontFamily: 'bilibiliFonts'),
                ),
                WidgetSpan(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.r),
                    width: 10.sp,
                    height: 10.sp,
                    child: Image.asset(ImageAssets.queryPNG),
                  ),
                ),
                TextSpan(
                  text: SR.transshipmentDesc.tr,
                  style: TextStyle(
                      color: HYAppTheme.norGrayColor,
                      fontSize: 10.sp,
                      fontFamily: 'bilibiliFonts'),
                ),
              ],
            ),
          ),
          Switch(
            value: true,
            onChanged: (value) {},
            inactiveThumbColor: HYAppTheme.norGrayColor.withOpacity(.1),
            inactiveTrackColor: HYAppTheme.norGrayColor.withOpacity(.35),
          )
        ],
      ),
    );
  }

  ///转载说明
  Widget buildTransshipmentContent() {
    return Container(
      padding: EdgeInsets.only(left: 15.r, right: 15.r, top: 10.r, bottom: 5.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
          color: HYAppTheme.norGrayColor.withOpacity(.1)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                SR.transshipmentSrc.tr,
                style:
                    TextStyle(color: HYAppTheme.norTextColors, fontSize: 10.sp),
              ),
              5.horizontalSpace,
              Text(
                SR.transshipmentDetail.tr,
                style:
                    TextStyle(color: HYAppTheme.norGrayColor, fontSize: 10.sp),
              )
            ],
          ),
          TextField(
            maxLines: 1,
            maxLength: 200,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: SR.transshipmentSrcHintText.tr,
                hintStyle:
                    TextStyle(color: HYAppTheme.norGrayColor, fontSize: 10.sp)),
          )
        ],
      ),
    );
  }

  ///已选择按钮
  Widget isCheckedButton() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 20.sp,
          height: 20.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.r)),
            border: Border.all(
              color: HYAppTheme.norMainThemeColors,
            ),
          ),
        ),
        Container(
          width: 10.sp,
          height: 10.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.r)),
            color: HYAppTheme.norMainThemeColors,
          ),
        ),
      ],
    );
  }

  ///未选择按钮
  Widget unCheckedButton() {
    return Container(
      width: 20.sp,
      height: 20.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50.r)),
        border: Border.all(
          color: HYAppTheme.norGrayColor,
        ),
      ),
    );
  }

  ///视频及标题
  Widget buildPreBuildVideoBodyHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                hintText: SR.pleaseInputTitle.tr,
                hintStyle: TextStyle(
                  color: HYAppTheme.norGrayColor,
                  fontSize: 12.sp,
                )),
          ),
        ),
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
                value: state.agreePolicy,
                onChanged: (value) {
                  logic.checkAgreePolicy(value);
                },
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
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back,
          color: HYAppTheme.norTextColors,
        ),
      ),
      title: Text(
        SR.publishVideo.tr,
        style: TextStyle(
            fontSize: 14.sp,
            color: HYAppTheme.norTextColors,
            fontWeight: FontWeight.normal,
            fontFamily: 'bilibiliFonts'),
      ),
      centerTitle: true,
    );
  }

  ///选择分区及话题
  Widget buildZoneAndTopicEditDialog(context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: HYAppTheme.norTextColors.withOpacity(.5),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 20.r),
            decoration: BoxDecoration(
                color: HYAppTheme.norWhite01Color,
                borderRadius: BorderRadius.vertical(top: Radius.circular(5.r))),
            width: 1.sw,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: HYAppTheme.norGrayColor,
                      borderRadius: BorderRadius.all(Radius.circular(50.r))),
                  height: 4.sp,
                  width: 35.sp,
                ),
                15.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      SR.cancel.tr,
                      style: TextStyle(
                        color: HYAppTheme.norTextColors.withOpacity(.7),
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      SR.chooseSectionAndTopic.tr,
                      style: TextStyle(
                        color: HYAppTheme.norTextColors,
                        fontSize: 13.sp,
                      ),
                    ),
                    Text(
                      SR.save.tr,
                      style: TextStyle(
                        color: HYAppTheme.norTextColors,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),

                ///待写
                // Container(
                //   decoration: BoxDecoration(
                //       color: HYAppTheme.norWhite01Color,
                //       borderRadius: BorderRadius.all(Radius.circular(5.r))),
                //   child: Row(
                //     children: [
                //       Text("分区")
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///编辑简介
  Widget buildProfileEditDialog(context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: HYAppTheme.norTextColors.withOpacity(.5),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 20.r),
            decoration: BoxDecoration(
                color: HYAppTheme.norWhite01Color,
                borderRadius: BorderRadius.vertical(top: Radius.circular(5.r))),
            width: 1.sw,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: HYAppTheme.norGrayColor,
                      borderRadius: BorderRadius.all(Radius.circular(50.r))),
                  height: 4.sp,
                  width: 35.sp,
                ),
                15.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      SR.cancel.tr,
                      style: TextStyle(
                        color: HYAppTheme.norTextColors.withOpacity(.7),
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      SR.profile.tr,
                      style: TextStyle(
                        color: HYAppTheme.norTextColors,
                        fontSize: 13.sp,
                      ),
                    ),
                    Text(
                      SR.save.tr,
                      style: TextStyle(
                        color: HYAppTheme.norTextColors,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
                30.verticalSpace,
                TextField(
                  autofocus: true,
                  maxLines: 4,
                  maxLength: 2000,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: HYAppTheme.norGrayColor.withOpacity(.1),
                      border: InputBorder.none,
                      hintText: SR.pleaseInputProfile.tr,
                      hintStyle: TextStyle(
                        color: HYAppTheme.norGrayColor,
                        fontSize: 12.sp,
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///编辑发布设置
  Widget buildPublishSettingEditDialog(context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: HYAppTheme.norTextColors.withOpacity(.5),
              ),
            ),
          ),
          Container(
            color: HYAppTheme.norGrayColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: HYAppTheme.norWhite01Color,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8.r))),
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        if (index == 0) {
                          return ListTile(
                            title: Text(
                              SR.timedRelease.tr,
                              style: TextStyle(
                                  color: HYAppTheme.norTextColors,
                                  fontSize: 14.sp),
                            ),
                            subtitle: Text(
                              SR.publishSettingDesc.tr,
                              style: TextStyle(
                                  color: HYAppTheme.norGrayColor,
                                  fontSize: 12.sp),
                            ),
                            trailing: Switch(
                              value: true,
                              onChanged: (value) {},
                              inactiveThumbColor:
                                  HYAppTheme.norGrayColor.withOpacity(.1),
                              inactiveTrackColor:
                                  HYAppTheme.norGrayColor.withOpacity(.35),
                            ),
                          );
                        } else {
                          return ListTile(
                            title: Text(SR.wonderfulCommentSection.tr,
                                style: TextStyle(
                                    color: HYAppTheme.norTextColors,
                                    fontSize: 14.sp)),
                            trailing: Switch(
                              value: false,
                              onChanged: (value) {},
                              inactiveThumbColor:
                                  HYAppTheme.norGrayColor.withOpacity(.1),
                              inactiveTrackColor:
                                  HYAppTheme.norGrayColor.withOpacity(.35),
                            ),
                          );
                        }
                      },
                      itemCount: 2),
                ),
                5.verticalSpace,
                Container(
                    color: HYAppTheme.norWhite01Color,
                    padding: EdgeInsets.symmetric(vertical: 20.r),
                    alignment: Alignment.center,
                    child: Text(
                      SR.finish.tr,
                      style: TextStyle(
                          color: HYAppTheme.norTextColors, fontSize: 14.sp),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  ///编辑动态
  Widget buildDynamicDialog(context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: HYAppTheme.norTextColors.withOpacity(.5),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 20.r),
            decoration: BoxDecoration(
                color: HYAppTheme.norWhite01Color,
                borderRadius: BorderRadius.vertical(top: Radius.circular(5.r))),
            width: 1.sw,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: HYAppTheme.norGrayColor,
                      borderRadius: BorderRadius.all(Radius.circular(50.r))),
                  height: 4.sp,
                  width: 35.sp,
                ),
                15.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      SR.cancel.tr,
                      style: TextStyle(
                        color: HYAppTheme.norTextColors.withOpacity(.7),
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      SR.publishDynamic.tr,
                      style: TextStyle(
                        color: HYAppTheme.norTextColors,
                        fontSize: 13.sp,
                      ),
                    ),
                    Text(
                      SR.save.tr,
                      style: TextStyle(
                        color: HYAppTheme.norTextColors,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
                30.verticalSpace,
                TextField(
                  autofocus: true,
                  maxLines: 4,
                  maxLength: 233,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: HYAppTheme.norGrayColor.withOpacity(.1),
                      border: InputBorder.none,
                      hintText: SR.pleaseInputDynamic.tr,
                      hintStyle: TextStyle(
                        color: HYAppTheme.norGrayColor,
                        fontSize: 12.sp,
                      )),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(BaiDuMapLocationScreen.routeName);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.r),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: HYAppTheme.norGrayColor.withOpacity(.5)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.r))),
                        height: 30.sp,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 14.sp,
                              height: 14.sp,
                              child: Image.asset(ImageAssets.locationGrayPNG),
                            ),
                            5.horizontalSpace,
                            Container(
                              height: 20.sp,
                              alignment: Alignment.center,
                              child: Text(
                                SR.whereAreYou.tr,
                                style: TextStyle(
                                    color: HYAppTheme.norGrayColor,
                                    fontSize: 12.sp),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    20.horizontalSpace,
                    SizedBox(
                      height: 16.sp,
                      width: 16.sp,
                      child: Image.asset(ImageAssets.icVoteCommonPNG),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
