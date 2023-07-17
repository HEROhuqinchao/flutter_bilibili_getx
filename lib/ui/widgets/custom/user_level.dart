import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';

List<String> _levelImage = [
  ImageAssets.icLv0PNG,
  ImageAssets.icLv1PNG,
  ImageAssets.icLv2PNG,
  ImageAssets.icLv3PNG,
  ImageAssets.icLv4PNG,
  ImageAssets.icLv5PNG,
  ImageAssets.icLv6PNG,
];

class UserLevel extends StatelessWidget {
  final int level;

  const UserLevel({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///改成返回图片的形式
    return Image.asset(
      _levelImage[level],
      fit: BoxFit.fill,
    );
    // return Container(
    //   margin: const EdgeInsets.only(left: 5).r,
    //   child: Text.rich(
    //     TextSpan(
    //       children: [
    //         WidgetSpan(
    //           child: Container(
    //             decoration: BoxDecoration(
    //                 color: Color.fromRGBO(233, 103, 43, 1),
    //                 borderRadius:
    //                     BorderRadius.horizontal(left: Radius.circular(2.r))),
    //             child: Text(" LV",
    //                 style: TextStyle(
    //                     fontSize: 8.sp,
    //                     color: Colors.white,
    //                     fontWeight: FontWeight.bold)),
    //           ),
    //         ),
    //         WidgetSpan(
    //           child: Container(
    //             decoration: BoxDecoration(
    //                 color: Color.fromRGBO(233, 103, 43, 1),
    //                 borderRadius:
    //                     BorderRadius.horizontal(right: Radius.circular(2.r))),
    //             child: Text("$level",
    //                 style: TextStyle(
    //                     fontSize: 9.sp,
    //                     color: Colors.white,
    //                     fontWeight: FontWeight.bold)),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
