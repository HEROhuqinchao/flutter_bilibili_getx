import 'package:flutter/material.dart';

import '../../../../../core/model/home_search_result.dart';
import '../../../../../core/model/search_keywords_model.dart';
import '../../../../../core/service/request/search_request.dart';

class SearchState {
  late HYSearchKeywordModel searchKeyword;
  List<ListElement> trendingList = [];
  late TextEditingController textEditingController;

  ///创建FocusNode对象实例(绑定TextField的焦点）
  late FocusNode focusNode;

  late HYSearchResultModel searchResult;
  bool showResult = false;

  late TabController mainTabController;
  late TabController subTabController;

  ///当前搜索的文本
  late String searchKeywordText;
  SearchState() {
    textEditingController = TextEditingController();
    mainTabController = TabController(length: 6, vsync: this);
    subTabController = TabController(length: 4, vsync: this);

    ///添加listener监听
    ///对应的TextField失去或者获取焦点都会回调此监听
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        // print('得到焦点');
      } else {
        // print('失去焦点');
      }
    });

    ///获取搜索热词
    HYSearchRequest.getSearchKeywordData().then((value) {
      searchKeyword = value;
      trendingList = searchKeyword.data[0].data!.list!;
      setState(() {});
    });
    searchKeywordText = "";
  }
}
