import 'package:bilibili_getx/core/wx_util/wx_util.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

import 'bilibili_test_logic.dart';

///只用于测试的界面!!!!
///到main.dart切换初始路由
class BilibiliTestScreen extends StatelessWidget {
  final logic = Get.find<BilibiliTestLogic>();
  final state = Get.find<BilibiliTestLogic>().state;
  static String routeName = "/bilibili_test";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BilibiliTestLogic>(
      builder: (logic) {
        return Scaffold(
          backgroundColor: Colors.blueGrey,
          body: Center(
            child: Column(
              children: [
                state.seaStarSwitchArtBoard != null
                    ? GestureDetector(
                        onTap: () {
                          logic.togglePlay();
                        },
                        child: Container(
                          width: 100.w,
                          height: 100.w,
                          child: Rive(
                            artboard: state.seaStarSwitchArtBoard!,
                          ),
                        ),
                      )
                    : Container(),
                state.liquidDownloadArtBoard != null
                    ? GestureDetector(
                        onTap: () {
                          logic.startDownloadFile();
                        },
                        child: Container(
                          width: 50.w,
                          height: 50.w,
                          child: Rive(
                            artboard: state.liquidDownloadArtBoard!,
                          ),
                        ),
                      )
                    : Container(),
                Container(
                  width: 100.w,
                  height: 100.w,
                  child: Lottie.network(
                      'https://assets10.lottiefiles.com/datafiles/QeC7XD39x4C1CIj/data.json'),
                ),
                Container(
                  width: 100.w,
                  height: 100.w,
                  child: Lottie.asset('assets/lottie/LottieLogo1.json'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
