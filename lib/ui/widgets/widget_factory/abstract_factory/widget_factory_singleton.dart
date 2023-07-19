import 'package:bilibili_getx/ui/widgets/widget_factory/abstract_factory/widget_abstract_factory.dart';
import 'package:flutter/foundation.dart';

import '../widget_factory/android_widget_factory.dart';
import '../widget_factory/ios_widget_factory.dart';

///根据平台不同建造不同工厂
mixin WidgetFactoryPlugin {
  late WidgetFactory _widgetFactory;

  ///获取组件工厂实例
  WidgetFactory wFactory() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      _widgetFactory = AndroidWidgetFactory.getInstance();
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      _widgetFactory = IosWidgetFactory.getInstance();
    } else {
      _widgetFactory = AndroidWidgetFactory.getInstance();
    }
    return _widgetFactory;
  }
}
