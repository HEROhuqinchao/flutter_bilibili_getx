import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'scan_login_logic.dart';

class ScanLoginScreen extends StatelessWidget {
  static const String routeName = "/scan_login";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ScanLoginLogic>();
    final state = Get
        .find<ScanLoginLogic>()
        .state;
    return GetBuilder<ScanLoginLogic>(builder: (logic) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // QrImage(
              //   data: "www.baidu.com",
              //   version: QrVersions.auto,
              //   gapless: false,
              //   size: 200.w,
              //   embeddedImage: AssetImage(ImageAssets.teenagerModePNG),
              //   embeddedImageStyle: QrEmbeddedImageStyle(
              //       size: Size(40.w, 40.w)),
              //   errorStateBuilder: (ctx, err) {
              //     return const Center(
              //       child: Text(
              //         "出错了,请稍后再试!",
              //         textAlign: TextAlign.center,
              //       ),
              //     );
              //   },
              //   semanticsLabel: "描述",
              // ),
              ElevatedButton(
                onPressed: () {
                  logic.scanQrCode();
                },
                child: Text("扫描二维码"),
              ),
              30.verticalSpace,
              Text(state.result)
            ],
          ),
        ),
      );
    });
  }
}
