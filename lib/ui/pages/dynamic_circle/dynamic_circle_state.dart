import 'package:flutter/cupertino.dart';

import '../../../core/model/web/dynamic/web_dynamic_v1_feed_all.dart';
import '../../widgets/expanded_widget.dart';

class DynamicCircleState {
  late WebDynamicV1FeedAllModel dynamicV1FeedAllData;
  late bool isLoading;
  // late List<GlobalKey<ExpandedWidgetState>> keys;
  // late List<bool> expandedList;
  DynamicCircleState() {
    isLoading = true;
    // keys = [];
    // expandedList = [];
  }
}
