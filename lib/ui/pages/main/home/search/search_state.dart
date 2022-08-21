import 'package:flutter/material.dart';

import '../../../../../core/model/home_search_result.dart';
import '../../../../../core/model/search_keywords_model.dart';
import '../../../../../core/service/request/search_request.dart';

class SearchState {
  late HYSearchKeywordModel searchKeyword;
  late List<ListElement> trendingList;
  late TextEditingController textEditingController;
  late FocusNode focusNode;
  late HYSearchResultModel searchResult;
  late bool showResult;

  ///当前搜索的文本
  late String searchKeywordText;
  SearchState() {
    trendingList = [];
    textEditingController = TextEditingController();
    showResult = false;
    focusNode = FocusNode();
    searchKeywordText = "";
  }
}
