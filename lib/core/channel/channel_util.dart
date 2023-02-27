import 'package:flutter/services.dart';

import 'bilibili_channel.dart';

///建立Method通道
class ChannelUtil {
  static MethodChannel methodChannel = MethodChannel(BilibiliChannel.uploadChannel);
  static MethodChannel stayAliveChannel = MethodChannel(BilibiliChannel.stayAliveChannel);
  static MethodChannel startServiceChannel = MethodChannel(BilibiliChannel.startServiceChannel);
  static MethodChannel chartChannel = MethodChannel(BilibiliChannel.chartChannel);
}