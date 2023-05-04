import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../widgets/scan_window.dart';
import 'scan_qr_logic.dart';

///扫描二维码（扫描文件和定制扫描界面）
class ScanQrView extends StatelessWidget {
  static String routeName = "/scan_qr";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ScanQrLogic>();
    final state = Get.find<ScanQrLogic>().state;

    return GetBuilder<ScanQrLogic>(builder: (logic) {
      return Scaffold(
        body: GestureDetector(
          onScaleUpdate: (ScaleUpdateDetails details) {
            if (details.pointerCount == 2) {
              state.scaleEnd = details.scale;
              double changeScale = state.scaleEnd - state.scaleBegin;
              state.scaleBegin = state.scaleEnd;
              state.scale = state.scale - changeScale;
              if(state.scale > 1) {
                state.scale = 1;
              }
              if(state.scale < 0) {
                state.scale = 0;
              }
              state.mobileScannerController.setZoomScale(state.scale);
            }
          },
          onScaleStart: (details) {
            state.scaleBegin = 1;
          },
          child: Stack(
            children: [
              MobileScanner(
                controller: state.mobileScannerController,

                ///扫描结果展示
                onDetect: (barcode) {
                  if (barcode.raw != null) {
                    final String code = barcode.raw!;
                    SmartDialog.showToast(code);
                  }
                },
              ),

              ///扫描界面
              RectScanWindow(),

              ///输入图片文件
              Positioned(
                right: 40.r,
                top: 60.r,
                child: IconButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      if (await state.mobileScannerController
                          .analyzeImage(image.path)) {
                        // SmartDialog.showToast("扫描二维码");
                      } else {
                        // SmartDialog.showToast("未扫描二维码");
                      }
                    }
                  },
                  icon: Icon(
                    Icons.image,
                    color: HYAppTheme.norMainThemeColors,
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
