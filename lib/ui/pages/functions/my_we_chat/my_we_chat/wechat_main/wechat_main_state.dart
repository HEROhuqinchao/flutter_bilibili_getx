import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../../../core/model/wechat/receive_data_model.dart';
import '../../../../../../core/model/wechat/wechat_users_model.dart';

class WechatMainState {
  ///websocket
  late WebSocketChannel webSocketChannel;

  ///用户列表
  late List<UserModel> userList;

  ///新消息
  late Map<String, ReceiveDataModel> latestMsgData;

  ///当前登录人id
  late String isLoginUserId;

  ///历史消息列表
  late List<Map> messageHistoryList;

  WechatMainState() {
    isLoginUserId = "";
    latestMsgData = {};
    messageHistoryList = [];
    userList = [];
  }
}
