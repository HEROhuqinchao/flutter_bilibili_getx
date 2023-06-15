import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../widgets/scan_window.dart';
import 'scan_qr_logic.dart';

///扫描二维码（扫描文件和定制扫描界面）
///https://pub.flutter-io.cn/packages/mobile_scanner
class ScanQrView extends StatelessWidget {
  static String routeName = "/scan_qr";

  final logic = Get.find<ScanQrLogic>();
  final state = Get.find<ScanQrLogic>().state;
  @override
  Widget build(BuildContext context) {


    return GetBuilder<ScanQrLogic>(builder: (logic) {
      return Scaffold(
        body: GestureDetector(
          onScaleUpdate: (ScaleUpdateDetails details) {
            ///当前2根手指接触了屏幕
            if (details.pointerCount == 2) {
              state.scaleEnd = details.scale;
              //算出缩放了多少比例
              double changeScale = state.scaleEnd - state.scaleBegin;
              state.scaleBegin = state.scaleEnd;
              //计算到真正缩放的数值
              state.scale = state.scale + changeScale;

              ///最大和最小的缩放比例
              if (state.scale > 1) {
                state.scale = 1;
              }
              if (state.scale < 0) {
                state.scale = 0;
              }
              //控制缩放比例
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
                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  // final Uint8List? image = capture.image;
                  for (final barcode in barcodes) {
                    debugPrint('Barcode found! ${barcode.rawValue}');
                  }
                },
              ),

              ///扫描框界面
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
