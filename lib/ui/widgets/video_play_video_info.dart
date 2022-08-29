// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../core/model/feed_index_model.dart';
// import '../../core/model/tag_archive_tags_model.dart';
// import '../../core/model/video_model.dart';
// import '../../core/service/request/video_play_request.dart';
// import '../shared/app_theme.dart';
// import '../shared/image_asset.dart';
// import '../shared/math_compute.dart';
// import 'expanded_widget.dart';
//
//
// GlobalKey<ExpandedWidgetState> cutDownWidgetKey = GlobalKey();
//
// class buildVideoPlayVideoInfo extends StatefulWidget {
//   FeedIndexItem video;
//
//   buildVideoPlayVideoInfo(this.video, {Key? key}) : super(key: key);
//
//   @override
//   State<buildVideoPlayVideoInfo> createState() =>
//       _buildVideoPlayVideoInfoState();
// }
//
// class _buildVideoPlayVideoInfoState extends State<buildVideoPlayVideoInfo> {
//   String _followers = "粉丝";
//   int _videos = 0;
//   bool isExpanded = false;
//   List<HYTagArchiveTagsModel> tags = [];
//   List<Widget> tagWidgets = [];
//
//   @override
//   void initState() {
//     HYVideoRequestRequest.getRelationStatData(widget.video.args!.upId!)
//         .then((value) {
//       _followers = value.data.followerText;
//       setState(() {});
//     });
//     HYVideoRequestRequest.getSpaceNavNumData(widget.video.args!.upId!)
//         .then((value) {
//       _videos = value.data.video;
//       setState(() {});
//     });
//     HYVideoRequestRequest.getTagArchiveTagsData(widget.video.args!.aid!).then((value) {
//       tags.clear();
//       tags.addAll(value);
//       for (HYTagArchiveTagsModel tag in tags) {
//         tagWidgets.add(buildVideoTag(tag.tagName));
//       }
//       setState(() {});
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20).r,
//       child: Column(
//         children: [
//           buildVideoPlayVideoInfoOwnerInfo(
//               widget.video.cover!, widget.video.args!.upName!),
//           15.verticalSpace,
//           buildVideoPlayVideoInfoVideoTitle(),
//           5.verticalSpace,
//           ExpandedWidget(
//             key: cutDownWidgetKey,
//             defaultHeight: 0,
//             child: buildVideoPlayVideoInfoVideoDetails(),
//           ),
//           10.verticalSpace,
//           buildVideoPlayVideoInfoButtonBanner(),
//         ],
//       ),
//     );
//   }
//
//   Widget buildVideoPlayVideoInfoVideoDetails() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Text(
//               widget.video.param!,
//               style: TextStyle(
//                   color: HYAppTheme.norGrayColor,
//                   fontSize: 12.sp),
//             ),
//             8.horizontalSpace,
//             buildIconInfo("assets/image/icon/ban_custom.png", "未经作者授权禁止转载"),
//           ],
//         ),
//         8.verticalSpace,
//         Text(
//           widget.video.title!,
//           style: TextStyle(
//               color: HYAppTheme.norGrayColor,
//               fontSize: 12.sp),
//         ),
//         30.verticalSpace,
//         Wrap(
//           spacing: 10.w,
//           runSpacing: 15.h,
//           alignment: WrapAlignment.start,
//           children: tagWidgets,
//         )
//       ],
//     );
//   }
//
//   Widget buildVideoTag(String text) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12).r,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(50.r),
//           color: const Color.fromRGBO(246, 247, 249, 1)),
//       child: Text(
//         text,
//         style: const TextStyle(color: HYAppTheme.norGray02Color),
//       ),
//     );
//   }
//
//   Widget buildVideoPlayVideoInfoOwnerInfo(String ownerIcon, String ownerName) {
//     return Row(
//       children: [
//         buildVideoPlayUserIcon(ownerIcon),
//         Expanded(
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10).r,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   ownerName,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: HYAppTheme.norMainThemeColors),
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "$_followers粉丝",
//                       style: TextStyle(
//                           color: HYAppTheme.norGrayColor,
//                           fontSize: 10.sp),
//                     ),
//                     10.horizontalSpace,
//                     Text(
//                       "$_videos视频",
//                       style: TextStyle(
//                           color: HYAppTheme.norGrayColor,
//                           fontSize: 10.sp),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//         TextButton(
//           child: const Text(
//             "+  关注",
//           ),
//           onPressed: () {},
//           style: TextButton.styleFrom(
//               padding: const EdgeInsets.symmetric(horizontal: 13).r,
//               backgroundColor: HYAppTheme.norMainThemeColors,
//               textStyle: TextStyle(
//                   fontSize: 12.sp, color: Colors.white)),
//         )
//       ],
//     );
//   }
//
//   //圆形图标
//   Widget buildVideoPlayUserIcon(String userLogo) {
//     return Container(
//       alignment: Alignment.centerLeft,
//       child: CircleAvatar(
//         backgroundImage: NetworkImage(userLogo),
//       ),
//     );
//   }
//
//   Widget buildVideoPlayVideoInfoVideoTitle() {
//     String _endDateText = getPubData(widget.video.pubdate).toString();
//     return Column(
//       children: [
//         GestureDetector(
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: isExpanded == false
//                     ? Text(
//                         widget.video.title!,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                             color: HYAppTheme.norTextColors,
//                             fontSize: 16.sp),
//                       )
//                     : Text(
//                   widget.video.title,
//                         style: TextStyle(
//                             color: HYAppTheme.norTextColors,
//                             fontSize: 16.sp),
//                       ),
//               ),
//               isExpanded == true
//                   ? Image.asset(
//                       ImageAssets.icArrowUpPNG,
//                       width: 23.w,
//                       height: 23.h,
//                     )
//                   : Image.asset(
//                       ImageAssets.icArrowDownPNG,
//                       width: 23.w,
//                       height: 23.h,
//                     ),
//             ],
//           ),
//           onTap: () {
//             isExpanded = !isExpanded;
//             cutDownWidgetKey.currentState?.widgetShift();
//             if (mounted) setState(() {});
//           },
//         ),
//         10.verticalSpace,
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             buildIconInfo("assets/image/icon/play_custom02.png",
//                 changeToWan(widget.video.stat["view"] ?? 0)),
//             10.horizontalSpace,
//             buildIconInfo("assets/image/icon/remark_custom02.png",
//                 changeToWan(widget.video.stat["danmaku"] ?? 0)),
//             10.horizontalSpace,
//             Text(
//               _endDateText.substring(0, _endDateText.length - 4),
//               style: TextStyle(
//                   color: HYAppTheme.norGrayColor,
//                   fontSize: 12.sp),
//             )
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget buildVideoPlayVideoInfoButtonBanner() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         buildVideoPlayIconButton("assets/image/icon/like_custom.png",
//             changeToWan(widget.video.stat["like"] ?? 0)),
//         buildVideoPlayIconButton("assets/image/icon/dislike_custom.png", "不喜欢"),
//         buildVideoPlayIconButton("assets/image/icon/coin_custom.png",
//             changeToWan(widget.video.stat["coin"] ?? 0)),
//         buildVideoPlayIconButton("assets/image/icon/collect_custom.png",
//             changeToWan(widget.video.stat["favorite"] ?? 0)),
//         buildVideoPlayIconButton("assets/image/icon/share_custom.png",
//             changeToWan(widget.video.stat["share"] ?? 0)),
//       ],
//     );
//   }
//
//   Widget buildVideoPlayIconButton(String icon, String text) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Image.asset(
//           icon,
//           width: 27.w,
//           height: 27.h,
//           color: HYAppTheme.norGray03Color,
//         ),
//         10.verticalSpace,
//         Text(
//           text,
//           style: TextStyle(
//               color: HYAppTheme.norGrayColor,
//               fontSize: 12.sp),
//         )
//       ],
//     );
//   }
//
//   Widget buildIconInfo(String icon, String text) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Image.asset(
//           icon,
//           width: 16.w,
//           height: 16.h,
//         ),
//         Container(
//           margin: const EdgeInsets.only(left: 5).r,
//           child: Text(
//             text,
//             style: TextStyle(
//                 color: HYAppTheme.norGrayColor,
//                 fontSize: 12.sp),
//           ),
//         )
//       ],
//     );
//   }
// }
