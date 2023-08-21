import 'package:flutter/services.dart';

import 'bilibili_channel.dart';

///建立Method通道
///参考资料 https://juejin.cn/post/7035211019618091045
/// MethodChannel 调用native方法
/// BasicMessageChannel 传递字符串和半结构化信息
/// EventChannel 数据流的通信（监听）
class ChannelUtil {
  static late MethodChannel? _getMediaMethodChannel;
  static late MethodChannel? _stayAliveChannel;
  static late MethodChannel? _startServiceChannel;
  static late MethodChannel? _chartChannel;

  ///拍摄媒体
  static late MethodChannel? _takeMediaChannel;

  ChannelUtil._internal();

  static final ChannelUtil _instance = ChannelUtil._internal();

  factory ChannelUtil() {
    _getMediaMethodChannel ??= MethodChannel(BilibiliChannel.uploadChannel);
    _stayAliveChannel ??= MethodChannel(BilibiliChannel.stayAliveChannel);
    _startServiceChannel ??= MethodChannel(BilibiliChannel.startServiceChannel);
    _chartChannel ??= MethodChannel(BilibiliChannel.chartChannel);
    _takeMediaChannel ??= MethodChannel(BilibiliChannel.takeMediaChannel);
    return _instance;
  }

  MethodChannel? get media => _getMediaMethodChannel;

  MethodChannel? get stayAlive => _stayAliveChannel;

  MethodChannel? get startService => _startServiceChannel;

  MethodChannel? get chart => _chartChannel;
}
