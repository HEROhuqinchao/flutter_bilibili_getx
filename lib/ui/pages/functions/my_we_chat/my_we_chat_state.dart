import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MyWeChatState {
  late WebSocketChannel webSocketChannel;
  late List<UserModel> userList;
  late Map<String, ReceiveDataModel> latestMsgData;

  MyWeChatState() {
    latestMsgData = {};
    userList = [
      UserModel(
        userId: "user002",
        name: "user002",
        latestMsg: "",
        avatarImage: ImageAssets.arPNG,
      ),
      UserModel(
        userId: "user003",
        name: "user003",
        latestMsg: "",
        avatarImage: ImageAssets.arPNG,
      ),
      UserModel(
        userId: "user004",
        name: "user004",
        latestMsg: "",
        avatarImage: ImageAssets.arPNG,
      ),
    ];
  }
}

///用户类
class UserModel {
  String userId; //用户Id
  String name; //名称
  String latestMsg; //最新消息
  String avatarImage; //头像

  UserModel({
    required this.userId,
    required this.name,
    required this.latestMsg,
    required this.avatarImage,
  }); //头像
}

///接受消息类
class ReceiveDataModel {
  String sender; //发送者
  String msg; //发送消息
  String date; //日期
  String avatar; //头像

  ReceiveDataModel({
    required this.sender,
    required this.msg,
    required this.date,
    required this.avatar,
  });

  factory ReceiveDataModel.fromJson(Map<String, dynamic> json) =>
      ReceiveDataModel(
        sender: json["sender"],
        msg: json["msg"],
        date: json["date"],
        avatar: json["avatar"],
      );
}