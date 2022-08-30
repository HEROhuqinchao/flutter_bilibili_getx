import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'mall_logic.dart';

class MallScreen extends StatelessWidget {
  static const String routeName = "/mall";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MallLogic>();
    final state = Get.find<MallLogic>().state;
    return SafeArea(
      child: GetBuilder<MallLogic>(builder: (logic) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0).r,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 120.w,
                    crossAxisSpacing: 5.r,
                    mainAxisSpacing: 25.r),
                itemBuilder: (ctx, index) {
                  return Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        width: 150.w,
                        height: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              offset: const Offset(3.0, 3.0),
                              blurRadius: .5,
                              spreadRadius: .5,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 10.w,
                        bottom: 10.w,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 80.w,
                              height: 110.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.1),
                                    offset: const Offset(3.0, 3.0),
                                    blurRadius: .5,
                                    spreadRadius: .5,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("XXXXX"),
                                Text("XXXXX"),
                                Text("XXXXX"),
                                Text("XXXXX"),
                                Text("XXXXX"),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }),
          ),
        );
      }),
    );
  }
}
