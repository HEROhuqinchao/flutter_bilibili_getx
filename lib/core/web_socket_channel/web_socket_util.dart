import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
class WebSocketUtil {
  String wssUrl = "...";

  // getWebSocketChannel() {
  //   WebSocketChannel webSocketChannel = IOWebSocketChannel.connect(
  //     Uri.parse(wssUrl),
  //     pingInterval: const Duration(seconds: 10),
  //     headers: {
  //       'Authorization': '',
  //     },
  //   );
  //   webSocketChannel.stream.listen((event) {
  //     print(event);
  //   });
  //   webSocketChannel.sink.add("data");
  // }
}