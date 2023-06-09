import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'we_chat_setting_logic.dart';

class WeChatSettingView extends StatelessWidget {
  static String routeName = "/wechat_setting";
  final logic = Get.find<WeChatSettingLogic>();
  final state = Get.find<WeChatSettingLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeChatSettingLogic>(
      builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            elevation: .1,
            backgroundColor: HYAppTheme.norWhite09Color,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.chevron_left,
                color: HYAppTheme.norBlackColors,
              ),
            ),
            title: Text(
              "设置",
              style: TextStyle(
                fontSize: 13.sp,
                color: HYAppTheme.norBlackColors,
              ),
            ),
          ),
          body: state.textButtons.isNotEmpty
              ? ListView.separated(
                  padding: EdgeInsets.only(bottom: 40.r),
                  physics: BouncingScrollPhysics(),
                  itemCount: state.textButtons.length,
                  itemBuilder: (ctx, index) {
                    if (index == state.textButtons.length - 2 ||
                        index == state.textButtons.length - 1) {
                      return GestureDetector(
                        onTap: () {
                          state.textButtons[index].onTapContext!(context);
                        },
                        child: Container(
                          color: HYAppTheme.norWhite01Color,
                          padding: EdgeInsets.symmetric(
                            vertical: 10.r,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            state.textButtons[index].text,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: HYAppTheme.norBlackColors,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.r,
                          horizontal: 15.r,
                        ),
                        color: HYAppTheme.norWhite01Color,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.textButtons[index].text,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: HYAppTheme.norBlackColors,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: HYAppTheme.norGrayColor,
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    if (index == 0 ||
                        index == 2 ||
                        index == 10 ||
                        index == 11 ||
                        index == 13 ||
                        index == 14 ||
                        index == 15) {
                      return 8.verticalSpace;
                    } else if (index == 6) {
                      return Container(
                        padding: EdgeInsets.only(
                            top: 20.r, left: 10.r, bottom: 10.r),
                        width: 1.sw,
                        child: Text(
                          "隐私",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: HYAppTheme.norGrayColor,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        height: .5.r,
                        width: 1.sw,
                        color: HYAppTheme.norGrayColor,
                      );
                    }
                  },
                )
              : Container(),
        );
      },
    );
  }
}
