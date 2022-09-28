import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'bilibili_test_logic.dart';

///只用于测试的界面!!!!
///到main.dart切换初始路由
class BilibiliTestScreen extends StatelessWidget {
  final logic = Get.find<BilibiliTestLogic>();
  final state = Get.find<BilibiliTestLogic>().state;
  static String routeName = "/test";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BilibiliTestLogic>(builder: (logic) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Text(state.destPath, style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              30.verticalSpace,
              GestureDetector(
                onTap: () {
                  logic.downloadFile();
                },
                child: Container(
                  color: Colors.green,
                  child: Text(
                    "开始下载",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
              ),
              30.verticalSpace,
              GestureDetector(
                onTap: () {
                  // logic.cancelDownload();
                },
                child: Container(
                  color: Colors.green,
                  child: Text(
                    "取消下载",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
              ),
              30.verticalSpace,
              GestureDetector(
                onTap: () {
                  // logic.deleteFile();
                },
                child: Container(
                  color: Colors.green,
                  child: Text(
                    "删除下载内容",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
              ),
              30.verticalSpace,
              Container(
                width: .8.sw,
                child: LinearProgressIndicator(
                  color: Colors.yellow,
                  value: state.downloadRatio,
                ),
              ),
              30.verticalSpace,
              Container(
                child: Text(
                  state.downloadIndicator,
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
              30.verticalSpace,
              GestureDetector(
                onTap: (){
                  logic.openFile();
                },
                child: Container(
                  child: Text(
                    "打开文件",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
