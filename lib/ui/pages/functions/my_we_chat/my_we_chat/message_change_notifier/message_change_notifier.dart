import 'package:flutter/cupertino.dart';

class MessageChangeNotifier extends ValueNotifier<int> {
  int message = 0;

  MessageChangeNotifier._internal() : super(0);

  static final MessageChangeNotifier _instance =
      MessageChangeNotifier._internal();

  factory MessageChangeNotifier.getInstance() => _instance;

  ///获取数据库中所有该用户的未读消息
  initLocalUnreadMessage(String userId) {
    notifyListeners();
  }

  ///接受消息
  receiveMessage(int messageNumber) {
    message += messageNumber;
    print(message);
    notifyListeners();
  }

  ///读取消息
  readMessage(int messageNumber) {
    message -= messageNumber;
    notifyListeners();
  }
}
