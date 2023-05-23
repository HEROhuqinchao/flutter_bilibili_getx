import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:bilibili_getx/ui/widgets/triangle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'chat_room_logic.dart';

Color greenColor = Color.fromRGBO(149, 236, 105, 1);
Color whiteColor = Color.fromRGBO(224, 224, 224, 1);

class ChatRoomView extends StatelessWidget {
  static String routeName = "/chat_room";
  final logic = Get.put(ChatRoomLogic());
  final state = Get.find<ChatRoomLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatRoomLogic>(builder: (logic) {
      return Scaffold(
        ///键盘顶住布局
        resizeToAvoidBottomInset: true,
        backgroundColor: Color.fromRGBO(237, 237, 237, 1),
        appBar: buildMyWeChatViewAppBar(),
        body: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  ///点击列表取消输入焦点
                  state.focusNode.unfocus();
                },
                child: Container(
                  color: HYAppTheme.norWhite01Color,
                  child: ListView.builder(
                    shrinkWrap: true,
                    // reverse: true,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.r,
                      vertical: 5.r,
                    ),
                    controller: state.messageListScrollController,
                    itemBuilder: (ctx, index) {
                      return buildChatRoomChatItem(index);
                    },
                    itemCount: state.chatRoomMessageList.length,
                  ),
                ),
              ),
            ),
            buildMyWeChatViewInputComponent(),
          ],
        ),
      );
    });
  }

  ///聊天室的头部
  buildMyWeChatViewAppBar() {
    return AppBar(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      toolbarHeight: 40.r,
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
      elevation: .1,
      title: Text(
        state.userModel.name,
        style: TextStyle(
          fontSize: 14.sp,
          color: HYAppTheme.norBlackColors,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 8.r),
            child: Icon(
              Icons.more_horiz_rounded,
              color: HYAppTheme.norBlackColors,
            ),
          ),
        )
      ],
    );
  }

  ///输入框
  buildMyWeChatViewInputComponent() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(247, 247, 247, 1),
        border: Border(
          top: BorderSide(
            color: Color.fromRGBO(235, 235, 235, 1),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.r,
        horizontal: 10.r,
      ),
      child: Row(
        children: [
          buildMyWeChatViewIconButton(ImageAssets.speakingPng),
          10.horizontalSpace,
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(3.r),
              ),
              child: TextField(
                focusNode: state.focusNode,
                controller: state.textEditingController,
                onChanged: (str) {
                  logic.updateInputText(str);
                },
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: HYAppTheme.norWhite01Color,
                  border: InputBorder.none,
                  hintText: "说点什么呗~",
                ),
              ),
            ),
          ),
          10.horizontalSpace,
          buildMyWeChatViewIconButton(ImageAssets.emojiPng),
          10.horizontalSpace,
          state.inputText.isEmpty
              ? buildMyWeChatViewIconButton(
                  ImageAssets.addMoreButtonPng,
                )
              : Material(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3.r),
                  ),
                  color: greenColor,
                  child: InkWell(
                    onTap: () {
                      logic.sendMessage();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.r,
                        horizontal: 12.r,
                      ),
                      child: Text("发送"),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  ///按钮控件
  buildMyWeChatViewIconButton(String image) {
    return Material(
      color: Color.fromRGBO(247, 247, 247, 1),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(2.r),
          child: Image(
            width: 25.r,
            height: 25.r,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }

  ///用户头像
  buildUserAvatar(String image) {
    return Material(
      borderRadius: BorderRadius.all(
        Radius.circular(3.r),
      ),
      color: Color.fromRGBO(247, 247, 247, 1),
      child: InkWell(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(3.r),
          ),
          child: Image(
            fit: BoxFit.cover,
            width: 32.r,
            height: 32.r,
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }

  ///聊天气泡
  buildChatRoomChatItem(int index) {
    bool isLeft = state.chatRoomMessageList[index].sender != state.loginUserId;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.r),
      child: Row(
        mainAxisAlignment:
            isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          isLeft
              ? Container(
                  margin: EdgeInsets.only(right: 5.r),
                  child:
                      buildUserAvatar(state.chatRoomMessageList[index].avatar),
                )
              : Container(),
          Stack(
            children: [
              isLeft
                  ? Positioned(
                      top: 15.r,
                      left: 10.r,
                      child: CustomPaint(
                        painter: RoundTriangleWidget(
                          color: greenColor,
                          height: -4.r,
                        ),
                      ),
                    )
                  : Positioned(
                      top: 15.r,
                      right: 10.r,
                      child: CustomPaint(
                        painter: RoundTriangleWidget(
                          color: whiteColor,
                          height: 4.r,
                        ),
                      ),
                    ),
              isLeft
                  ? Container(
                      margin: EdgeInsets.only(left: 9.8.r),
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.r),
                        ),
                        color: greenColor,
                      ),
                      child: Text(state.chatRoomMessageList[index].msg),
                    )
                  : Container(
                      margin: EdgeInsets.only(right: 9.8.r),
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.r),
                        ),
                        color: whiteColor,
                      ),
                      child: Text(state.chatRoomMessageList[index].msg),
                    ),
            ],
          ),
          !isLeft
              ? Container(
                  margin: EdgeInsets.only(left: 5.r),
                  child:
                      buildUserAvatar(state.chatRoomMessageList[index].avatar),
                )
              : Container(),
        ],
      ),
    );
  }
}

class RoundTriangleWidget extends CustomPainter {
  ///填充颜色
  Color color;

  ///x轴轴距
  double height;

  RoundTriangleWidget({
    required this.color,
    required this.height,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    Path path = Path();
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    path
      ..moveTo(0, 4.r)
      ..conicTo(height, 1.r, height, -1.r, 2)
      ..lineTo(0, -4.r)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
