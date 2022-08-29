import 'package:bilibili_getx/ui/widgets/video_play_related_video_item.dart';
import 'package:bilibili_getx/ui/widgets/video_play_video_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/model/feed_index_model.dart';
import '../../../../core/service/request/video_play_request.dart';
import '../../core/model/video_model.dart';
import '../shared/app_theme.dart';

class HYVideoPlayProfile extends StatefulWidget {
  ///新数据
  FeedIndexItem video;

  ///旧数据
  HYVideoModel oldVideo;

  HYVideoPlayProfile({required this.video, required this.oldVideo});

  @override
  State<HYVideoPlayProfile> createState() => _HYVideoPlayProfileState();
}

class _HYVideoPlayProfileState extends State<HYVideoPlayProfile>
    with AutomaticKeepAliveClientMixin {
  int pageIndex = 1;
  int pageSize = 10;
  late List<HYVideoModel> relatedVideos = [];
  late List<HYVideoModel> allRelatedVideos = []; //最多40条，这个api没有分页的设置，就全加载进来
  // bool isLoadingItem = true;

  @override
  void initState() {
    HYVideoRequestRequest.getArchiveRelatedData(widget.video.args!.aid!)
        .then((value) {
      if (mounted) {
        setState(() {
          allRelatedVideos.addAll(value);
          relatedVideos
              .addAll(allRelatedVideos.sublist(0, pageIndex * pageSize));
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return EasyRefresh(
      onLoad: () async {
        await Future.delayed(const Duration(seconds: 1)).then((value) {
          if (mounted) {
            setState(() {
              //每次获取新的4条数据
              relatedVideos.addAll(allRelatedVideos.sublist(
                  pageIndex * pageSize, (++pageIndex) * pageSize));
            });
          }
        });
      },
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildVideoPlayVideoInfo(widget.oldVideo),
              relatedVideos.isNotEmpty
                  ? buildHYVideoPlayRelatedVideos()
                  : Center(
                      child: SizedBox(
                        width: 30.w,
                        height: 30.h,
                        child: const CircularProgressIndicator(
                          color: HYAppTheme.norMainThemeColors,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  /**
   * relatedVideos要放在widget里，而不是state里，否则这里的的length始终为0
   */
  Widget buildHYVideoPlayRelatedVideos() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20).r,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: relatedVideos.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisExtent: 205.h,
          maxCrossAxisExtent:
              180.w,
        ),
        itemBuilder: (ctx, index) {
          return HYVideoPlayRelatedVideoItem(relatedVideos[index]);
        },
      ),
    );
  }

  // bool notificationFunction(Notification notification) {
  //    switch (notification.runtimeType) {
  //     case ScrollStartNotification:
  //      isLoadingItem = false;
  //      break;
  //     case ScrollUpdateNotification:
  //      break;
  //     case ScrollEndNotification:
  //      setState(() {
  //       isLoadingItem = true;
  //       });
  //      break;
  //     case OverscrollNotification:
  //      break;
  //     }
  //    return true;
  // }

  ///防止重绘
  @override
  bool get wantKeepAlive => true;
}
