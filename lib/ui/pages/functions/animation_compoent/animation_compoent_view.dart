import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

import 'animation_compoent_logic.dart';

///动画（river&lottie）
class AnimationCompoentView extends StatelessWidget {
  static String routeName = "/animation_component";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<AnimationCompoentLogic>();
    final state = Get.find<AnimationCompoentLogic>().state;

    return GetBuilder<AnimationCompoentLogic>(
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
