import 'package:flutter/cupertino.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../../core/model/wechat/receive_data_model.dart';
import '../../../../../core/model/wechat/wechat_users_model.dart';
import '../my_we_chat/my_we_chat_state.dart';

class ChatRoomState {
  ///当前聊天人信息
  late UserModel? userModel;

  ///输入的内容
  late String inputText;

  ///webSocket
  late WebSocketChannel webSocketChannel;

  ///消息列表
  late List<ReceiveDataModel> chatRoomMessageList;

  ///消息滑动控制
  late ScrollController messageListScrollController;

  ///输入框控制
  late TextEditingController textEditingController;

  ///登录人的id
  late String isLoginUserId;

  ///焦点
  late FocusNode focusNode;

  ///是否为输入模式(表情符切换为键盘符)
  late bool isEmojiMode;

  ///是否为语音模式(语音切换成键盘)
  late bool isVoiceMode;

  ///是否为更多模式
  late bool isAddMoreMode;

  ///表情内容高度
  late double emojiBlockHeight;

  ///更多块高度
  late double moreBlockHeight;

  ///更多按钮
  late List<List<ImageButtonModel>> moreBlockImageButtonList;

  ///是否进入到聊天室(用于消息的已读未读的判断)
  late bool isStay;

  ChatRoomState() {
    userModel = null;
    inputText = "";
    chatRoomMessageList = [];
    messageListScrollController = ScrollController();
    textEditingController = TextEditingController();
    isLoginUserId = "";
    focusNode = FocusNode();
    isEmojiMode = false;
    isVoiceMode = false;
    isAddMoreMode = false;
    emojiBlockHeight = 0;
    moreBlockHeight = 0;
    moreBlockImageButtonList = [];
    isStay = false;
  }
}

class ImageButtonModel {
  String image;
  String text;
  Function() onTap;

  ImageButtonModel({
    required this.image,
    required this.text,
    required this.onTap,
  });
}
