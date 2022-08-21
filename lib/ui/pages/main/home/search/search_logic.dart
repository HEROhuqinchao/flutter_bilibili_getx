import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../../core/service/request/search_request.dart';
import 'search_state.dart';

class SearchLogic extends GetxController {
  final SearchState state = SearchState();
  @override
  void onReady() {
    ///初始化监听输入框输入
    initFocusNode();
    ///获取搜索热词
    initSearchKeywords();
    super.onReady();
  }

  @override
  void onClose() {
    state.textEditingController.removeListener(() {});
    state.textEditingController.dispose();
    state.focusNode.dispose();
  }

  void initFocusNode() {
    state.focusNode.addListener(() {
      if (state.focusNode.hasFocus) {
        // print('得到焦点');
      } else {
        // print('失去焦点');
      }
    });
  }

  void initSearchKeywords() {
    HYSearchRequest.getSearchKeywordData().then((value) {
      state.searchKeyword = value;
      state.trendingList = state.searchKeyword.data[0].data!.list!;
      update();
    });
  }

  ///完成输入并开始搜索，获取所有结果
  void finishInputAndStartSearch(String text) {
    state.searchKeywordText = text;

    ///关闭弹框
    SmartDialog.dismiss();

    ///设置文本
    state.textEditingController.text = text;

    ///失去焦点
    unFocusFunction();

    ///隐藏键盘
    hideKeyBoard();

    ///获取搜索的结果
    HYSearchRequest.getSearchResultData(text).then((searchResultData) {
      ///显示搜索结果
      state.showResult = true;
      state.searchResult = searchResultData;
      update();
    });
  }

  ///获取焦点
  void getFocusFunction(BuildContext context) {
    FocusScope.of(context).requestFocus(state.focusNode);
  }

  ///失去焦点
  void unFocusFunction() {
    state.focusNode.unfocus();
  }

  ///隐藏键盘而不丢失文本字段焦点：
  void hideKeyBoard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
