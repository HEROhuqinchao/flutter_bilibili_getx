///接受消息类
class ReceiveDataModel {
  String sender; //发送者
  String receiver; //发送者
  String msg; //发送消息
  int date; //日期
  String avatar; //头像
  bool isRead; //

  ReceiveDataModel({
    required this.sender,
    required this.receiver,
    required this.msg,
    required this.date,
    required this.avatar,
    required this.isRead,
  });

  factory ReceiveDataModel.fromJson(Map<String, dynamic> json) =>
      ReceiveDataModel(
        sender: json["sender"],
        receiver: json["receiver"],
        msg: json["msg"],
        date: json["date"],
        avatar: json["avatar"],
        isRead: json["isRead"] ?? false,
      );
}
