import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/app_theme.dart';
///轮播图的底部的指示标志
class BangumiSwiperPagination extends StatefulWidget {
  ///当前的页面的下标
  int currentIndex;

  ///总共几个页面
  int itemCount;

  BangumiSwiperPagination(
      {Key? key, required this.currentIndex, required this.itemCount})
      : super(key: key);

  @override
  State<BangumiSwiperPagination> createState() =>
      _BangumiSwiperPaginationState();
}

class _BangumiSwiperPaginationState extends State<BangumiSwiperPagination> {
  late ScrollController _swiperPaginationController;

  @override
  void initState() {
    _swiperPaginationController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _swiperPaginationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.w,
      child: GridView.builder(
        controller: _swiperPaginationController,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.itemCount,
          childAspectRatio: 5 / 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return widget.currentIndex == index
              ? Container(
            decoration: BoxDecoration(
                color: HYAppTheme.norMainThemeColors,
                borderRadius: BorderRadius.circular(5.r)),
          )
              : CircleAvatar(
            backgroundColor: HYAppTheme.norGrayColor,
            radius: 4.r,
          );
        },
        itemCount: widget.itemCount,
      ),
    );
  }
}