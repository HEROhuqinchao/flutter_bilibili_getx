import 'dart:ui';

import '../../../core/model/android/mall/mall_search_model.dart';
import '../../../core/model/web/mall/ticket_project_listV2_model.dart';

class MallState {
  ///网页端会员购数据
  // late TicketProjectListV2Model ticketProjectListV2Model;
  late int total;
  late List<Result> result;
  late int numResults;
  late int numPages;
  late List<double> backgroundSpreadRadius;
  late List<double> backgroundBlurRadius;
  late List<double> coverBottomGap;
  late List<Offset> backgroundOffset;
  late Vo vo;
  late double appBarOpacity;

  ///起始页码
  late int page;

  ///一页中的数据条数
  late int pageSize;

  MallState() {
    total = 0;
    result = [];
    numResults = 0;
    numPages = 0;
    page = 1;
    pageSize = 16;
    backgroundSpreadRadius = [];
    backgroundBlurRadius = [];
    coverBottomGap = [];
    backgroundOffset = [];
    appBarOpacity = 0;
  }
}
