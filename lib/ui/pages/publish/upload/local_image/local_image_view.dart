import 'dart:io';

import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../upload_logic.dart';
import 'local_image_logic.dart';

class LocalImageComponent extends StatefulWidget {
  @override
  State<LocalImageComponent> createState() => _LocalImageComponentState();
}

class _LocalImageComponentState extends State<LocalImageComponent>
    with AutomaticKeepAliveClientMixin {
  final logic = Get.put(LocalImageLogic());
  final state = Get.find<LocalImageLogic>().state;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<LocalImageLogic>(builder: (logic) {
      return state.localImageList.isNotEmpty
          ? GridView.builder(
              itemCount: state.localImageList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 5.w,
                mainAxisSpacing: 5.h,
                crossAxisCount: 3,
              ),
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    final logic = Get.find<UploadLogic>();
                    logic.showFileContent(
                        0, state.localImageList[index].imageLocation);
                  },
                  child: Image.file(
                    File(state.localImageList[index].imageLocation),
                    fit: BoxFit.cover,
                  ),
                );
              },
            )
          : Center(
              child: Text(
                "啥也么有",
                style: TextStyle(
                    color: HYAppTheme.norWhite01Color, fontSize: 14.sp),
              ),
            );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
