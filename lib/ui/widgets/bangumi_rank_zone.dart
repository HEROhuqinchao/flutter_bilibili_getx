import 'package:bilibili_getx/ui/widgets/rank_no.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/model/android/home/pgc_page_bangumi_model.dart';
import '../shared/app_theme.dart';
///热门番剧区、热门国创区
class BuildBangumiRankZone extends StatefulWidget {
  int zoneNum;
  List<Module> modules;

  BuildBangumiRankZone(this.zoneNum, this.modules, {Key? key}) : super(key: key);

  @override
  State<BuildBangumiRankZone> createState() => _BuildBangumiRankZoneState();
}

class _BuildBangumiRankZoneState extends State<BuildBangumiRankZone> {
  late ScrollController _rankScrollController;
  ///番剧排名排名1,2,3...的背景颜色
  late List<Color> rankColor;
  @override
  void initState() {
    _rankScrollController = ScrollController();
    rankColor = [
      const Color.fromRGBO(252, 176, 38, 1),
      const Color.fromRGBO(147, 176, 219, 1),
      const Color.fromRGBO(236, 158, 145, 1),
      const Color.fromRGBO(122, 134, 150, .9),
      const Color.fromRGBO(122, 134, 150, .8),
      const Color.fromRGBO(122, 134, 150, .7),
      const Color.fromRGBO(122, 134, 150, .6),
      const Color.fromRGBO(122, 134, 150, .5),
      const Color.fromRGBO(122, 134, 150, .5),
      const Color.fromRGBO(122, 134, 150, .5),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _rankScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Module> modules = widget.modules;
    int zoneNum = widget.zoneNum;
    return modules.isNotEmpty
        ? Column(
      children: [
        Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10.r)),
              clipBehavior: Clip.antiAlias,
              child: Opacity(
                opacity: .3,
                child: Container(
                  color: HYAppTheme.norTextColors,
                  child: Image.network(
                    modules[zoneNum].cover!,
                    fit: BoxFit.fill,
                    height: 230.w,
                    width: 1.sw,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        modules[zoneNum].title!,
                        style: TextStyle(
                          color: HYAppTheme.norTextColors,
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        "${modules[zoneNum].headers![0]!.title}>",
                        style: TextStyle(
                          color: HYAppTheme.norTextColors,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    modules[zoneNum].desc!,
                    style: TextStyle(
                      color: HYAppTheme.norGrayColor,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 190.w,
                    child: ListView.builder(
                      controller: _rankScrollController,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        return Container(
                          padding:
                          const EdgeInsets.only(top: 10, right: 5).r,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 130.w,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.r)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                modules[zoneNum]
                                                    .items![index]!
                                                    .cover!),
                                            fit: BoxFit.cover,
                                            filterQuality:
                                            FilterQuality.low)),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: RankNo(
                                      text: (index + 1).toString(),
                                      color: rankColor[index],
                                    ),
                                  ),
                                  Positioned(
                                    right: 5.w,
                                    bottom: 5.h,
                                    child: Text(
                                      modules[zoneNum]
                                          .items![index]!
                                          .bottomRightBadge!
                                          .text!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                        10.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 5).r,
                                alignment: Alignment.centerLeft,
                                width: 80.w,
                                child: Text(
                                  modules[zoneNum].items![index]!.title!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: HYAppTheme.norTextColors,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 5).r,
                                alignment: Alignment.centerLeft,
                                width: 80.w,
                                child: Text(
                                  modules[zoneNum].items![index]!.desc!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: HYAppTheme.norGrayColor,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: 10,
                      // itemCount: _modules[zoneNum].items.length,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    )
        : Container();
  }
}