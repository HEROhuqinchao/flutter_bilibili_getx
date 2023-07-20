import 'package:flutter/cupertino.dart';

class MessageChangeNotifier extends ValueNotifier<Map<String, int>> {
  Map<String, int> unReadMessage = {};

  MessageChangeNotifier._internal() : super({});

  static final MessageChangeNotifier _instance =
      MessageChangeNotifier._internal();

  factory MessageChangeNotifier.getInstance() => _instance;

  ///获取数据库中所有该用户的未读消息
  initLocalUnreadMessage(Map<String, int> initMap) {
    unReadMessage.addAll(initMap);
    notifyListeners();
  }

  ///接受消息（给这个人加一条未读消息）
  receiveMessage(String sender) {
    int? unReadMessageNumber = unReadMessage[sender];
    if (unReadMessageNumber != null) {
      unReadMessage[sender] = unReadMessageNumber + 1;
    } else {
      unReadMessage[sender] = 1;
    }
    notifyListeners();
  }

  ///读取消息（移除掉所有这个人的未读消息数量）
  readMessage(String sender) {
    unReadMessage.removeWhere((key, value) => key == sender);
    notifyListeners();
  }

  ///计算所有未读消息数量
  int get allUnReadMessage {
    int number = 0;
    unReadMessage.forEach((key, value) {
      number += value;
    });
    return number;
  }

  ///计算某个好友的未读消息
  int userUnReadMessage(String userId) {
    return unReadMessage[userId] ?? 0;
  }
}
