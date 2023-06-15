import 'package:bilibili_getx/core/package_info/package_info_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DownloadFileView extends StatefulWidget {
  static const String routeName = "/download_file";

  const DownloadFileView({super.key});

  @override
  State<DownloadFileView> createState() => _DownloadFileViewState();
}

class _DownloadFileViewState extends State<DownloadFileView> {
  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<DownloadFileLogic>();
    // final state = Get.find<DownloadFileLogic>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text("下载文件"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: .5.sh,
          child: Column(
            children: [
              Text(
                "当前APP版本${PackageInfoUtil.getVersion()}",
                style: TextStyle(
                  fontSize: 30.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
