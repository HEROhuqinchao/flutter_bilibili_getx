import 'package:flutter/cupertino.dart';

class MessageChangeNotifier extends ChangeNotifier {
  int message = 0;

  ///获取数据库中所有该用户的未读消息
  initLocalUnreadMessage(String userId) {
    notifyListeners();
  }

  ///接受消息
  receiveMessage(int messageNumber) {
    message += messageNumber;
    notifyListeners();
  }

  ///读取消息
  readMessage(int messageNumber) {
    message -= messageNumber;
    notifyListeners();
  }
}
