import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../../core/model/wechat/wechat_users_model.dart';

class MyWeChatState {
  late int friendsNumber;
  late int currentIndex;
  late bool loading;
  MyWeChatState() {
    friendsNumber = 0;
    currentIndex = 0;
    loading = true;
  }
}
