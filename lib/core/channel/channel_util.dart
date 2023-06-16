import 'package:flutter/services.dart';

import 'bilibili_channel.dart';

///建立Method通道
///参考资料 https://juejin.cn/post/7035211019618091045
/// MethodChannel 调用native方法
/// BasicMessageChannel 传递字符串和半结构化信息
/// EventChannel 数据流的通信（监听）
class ChannelUtil {
  late MethodChannel getMediaMethodChannel;
  late MethodChannel stayAliveChannel;
  late MethodChannel startServiceChannel;
  late MethodChannel chartChannel;
  late MethodChannel takeMediaChannel;

  ChannelUtil._internal() {
    getMediaMethodChannel = MethodChannel(BilibiliChannel.uploadChannel);
    stayAliveChannel = MethodChannel(BilibiliChannel.stayAliveChannel);
    startServiceChannel = MethodChannel(BilibiliChannel.startServiceChannel);
    chartChannel = MethodChannel(BilibiliChannel.chartChannel);

    ///获取媒体
    takeMediaChannel = MethodChannel(BilibiliChannel.takeMediaChannel);
  }

  static final ChannelUtil _instance = ChannelUtil._internal();

  factory ChannelUtil() => _instance;
}
