import 'package:flutter/services.dart';

import 'bilibili_channel.dart';

///建立Method通道
///参考资料 https://juejin.cn/post/7035211019618091045
/**
 * MethodChannel 调用native方法
 * BasicMessageChannel 传递字符串和半结构化信息
 * EventChannel 数据流的通信（监听）
 */
class ChannelUtil {
  ///获取媒体
  static MethodChannel getMediaMethodChannel =
      MethodChannel(BilibiliChannel.uploadChannel);
  static MethodChannel stayAliveChannel =
      MethodChannel(BilibiliChannel.stayAliveChannel);
  static MethodChannel startServiceChannel =
      MethodChannel(BilibiliChannel.startServiceChannel);
  static MethodChannel chartChannel =
      MethodChannel(BilibiliChannel.chartChannel);

}
