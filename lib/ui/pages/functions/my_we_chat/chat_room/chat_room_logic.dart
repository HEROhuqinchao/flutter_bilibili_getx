import 'package:flutter/animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../shared/image_asset.dart';
import 'chat_room_state.dart';

class ChatRoomLogic extends GetxController {
  final ChatRoomState state = ChatRoomState();

  @override
  void onReady() {
    state.moreBlockImageButtonList = [
      [
        ImageButtonModel(
            image: ImageAssets.photoGalleryPng, text: '相册', onTap: () {}),
        ImageButtonModel(
            image: ImageAssets.takePhotoPng, text: '拍摄', onTap: () {}),
        ImageButtonModel(
            image: ImageAssets.videoCallPng, text: '视频通话', onTap: () {}),
        ImageButtonModel(
            image: ImageAssets.locationPng, text: '位置', onTap: () {}),
        ImageButtonModel(
            image: ImageAssets.voiceInputPng, text: '语音输入', onTap: () {}),
        ImageButtonModel(
            image: ImageAssets.myCollectionPng, text: '我的收藏', onTap: () {}),
        ImageButtonModel(
            image: ImageAssets.idCardPng, text: '名片', onTap: () {}),
        ImageButtonModel(image: ImageAssets.filePng, text: '文件', onTap: () {}),
      ],
      [
        ImageButtonModel(image: ImageAssets.musicPng, text: '音乐', onTap: () {}),
      ],
    ];
    state.moreBlockImageButtonList.length;
    for (int i = 0; i < state.moreBlockImageButtonList.length; i++) {}
    state.focusNode.addListener(() {
      if (state.focusNode.hasFocus) {
        state.emojiBlockHeight = 0.r;
        state.isEmojiMode = false;
        update();

        ///延迟计算最大滑动距离，配合resizeToAvoidBottomInset，键盘顶住布局
        Future.delayed(Duration(milliseconds: 500), () {
          double max =
              state.messageListScrollController.position.maxScrollExtent;
          state.messageListScrollController.animateTo(
            max,
            duration: Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        });
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    state.messageListScrollController.dispose();
    state.focusNode.dispose();
    super.onClose();
  }

  ///发送信息
  sendMessage() {
    if (state.inputText.isNotEmpty) {
      int sendTime = DateTime.now().millisecondsSinceEpoch;
      String data =
          "{\"users\": [\"${state.loginUserId}\",\"${state.userModel.userId}\"],"
          "\"msg\": \"${state.inputText}\","
          "\"date\": \"$sendTime\","
          "\"avatar\": \"https://static.runoob.com/images/demo/demo2.jpg\","
          "\"sender\": \"${state.loginUserId}\"}";
      state.webSocketChannel.sink.add(data);
      state.inputText = "";
      state.textEditingController.text = "";
      update();
    } else {
      SmartDialog.showToast("内容为空");
    }
  }

  ///更新输入内容
  updateInputText(String str) {
    state.inputText = str;
    update();
  }

  updateInputTextByEmoji(int emojiStr) {
    state.textEditingController.text += String.fromCharCode(emojiStr);
    state.inputText = state.textEditingController.text;
    update();
  }

  ///切换语音输入
  updateVoiceInput() {
    state.isVoiceMode = !state.isVoiceMode;
    state.isEmojiMode = false;
    if (state.isVoiceMode) {
      state.emojiBlockHeight = 0;
      state.focusNode.unfocus();
    } else {
      state.focusNode.requestFocus();
    }
    update();
  }

  ///点击表情
  updateEmoji() {
    state.isEmojiMode = !state.isEmojiMode;
    state.isVoiceMode = false;
    state.isAddMoreMode = false;
    state.emojiBlockHeight = 230.r;
    if (state.isEmojiMode) {
      state.focusNode.unfocus();
    } else {
      state.focusNode.requestFocus();
    }
    update();
  }

  ///点击更多按钮
  updateAddMoreButton() {
    state.isAddMoreMode = !state.isAddMoreMode;
    state.isVoiceMode = false;
    state.isEmojiMode = false;
    state.emojiBlockHeight = 230.r;
    if (state.isAddMoreMode) {
      state.focusNode.unfocus();
    } else {
      state.focusNode.requestFocus();
    }
    update();
  }

  ///点击列表取消输入焦点
  hideInput() {
    state.emojiBlockHeight = 0;
    state.focusNode.unfocus();
    update();
  }
}
