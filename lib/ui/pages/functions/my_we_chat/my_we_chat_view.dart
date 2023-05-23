import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'chat_room/chat_room_logic.dart';
import 'chat_room/chat_room_view.dart';
import 'my_we_chat_logic.dart';
import 'my_we_chat_state.dart';

///仿微信
class MyWeChatView extends StatelessWidget {
  static String routeName = "/my_we_chat";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MyWeChatLogic>();
    final state = Get.find<MyWeChatLogic>().state;

    return GetBuilder<MyWeChatLogic>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          elevation: .1,
          title: Text("myWeChat(user001)"),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            String userId = state.userList[index].userId;
            ReceiveDataModel? receiveData = state.latestMsgData[userId];
            return InkWell(
              onTap: () {
                logic.go2ChatRoom(index);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8.r,
                  horizontal: 15.r,
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.r),
                      ),
                      child: Container(
                        color: HYAppTheme.norGrayColor,
                        width: 50.r,
                        height: 50.r,
                        child: Image.asset(
                          ImageAssets.arPNG,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.r,
                          horizontal: 10.r,
                        ),
                        height: 50.r,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(state.userList[index].name),
                                Text(
                                    receiveData != null ? receiveData.date : "")
                              ],
                            ),
                            Text(
                              receiveData != null ? receiveData.msg : "",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: state.userList.length,
        ),
      );
    });
  }
}
