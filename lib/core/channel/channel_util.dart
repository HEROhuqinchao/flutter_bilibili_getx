import 'package:flutter/services.dart';

import 'bilibili_channel.dart';

class ChannelUtil {
  static MethodChannel methodChannel = MethodChannel(BilibiliChannel.uploadChannel);
}
