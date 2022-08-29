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
          body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 120.w,
                  mainAxisSpacing: 10.r,
                  crossAxisSpacing: 10.r),
              itemBuilder: (ctx, index) {
                return Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.circular(5.r),
                      ),
                      child: Container(
                        width: 150.w,
                        height: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide.none,
                            left: BorderSide.none,
                            right: BorderSide(width: 1, color: Colors.black.withOpacity(.1)),
                            bottom: BorderSide(width: 1, color: Colors.black.withOpacity(.1)),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.5),
                              offset: const Offset(2.0, 2.0),
                              blurRadius: 2,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.3),
                                    offset: const Offset(1.0, 1.0),
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                  )
                                ]),
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
        );
      }),
    );
  }
}
