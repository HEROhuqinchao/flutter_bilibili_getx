import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

import '../../../../core/web_socket_channel/web_socket_util.dart';
import 'my_we_chat_state.dart';

class MyWeChatLogic extends GetxController {
  final MyWeChatState state = MyWeChatState();

  @override
  void onReady() {
    ///连接webSocket
    state.webSocketChannel = IOWebSocketChannel.connect(
      Uri.parse(WebSocketUtil.wssUrl),
      pingInterval: const Duration(seconds: 10),
      headers: {
        "token": "{\"userId\": \"user001\"}",
      },
    );
    state.webSocketChannel.stream.listen((event) {
      // {
      //     "msg": "你好", //发送内容
      //     "sender": "user001" ///发送者
      // }
      // try {
      //
      // }
      print(event);
    });
    super.onReady();
  }
}
