import 'dart:async';

class MyWeChatState {
  late int friendsNumber;
  late int currentIndex;
  late bool loading;
  late StreamController<int> streamController;

  MyWeChatState() {
    friendsNumber = 0;
    currentIndex = 0;
    loading = true;
    streamController = StreamController.broadcast();
  }
}
