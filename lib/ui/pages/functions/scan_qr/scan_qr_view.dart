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
        body: Stack(
          children: [
            MobileScanner(
              ///扫描结果展示
              onDetect: (barcode, args) {
                if (barcode.rawValue != null) {
                  final String code = barcode.rawValue!;
                  SmartDialog.showToast(code);
                }
              },

              ///是否允许重复
              allowDuplicates: false,
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
                        SmartDialog.showToast("扫描二维码");
                      } else {
                        SmartDialog.showToast("未扫描二维码");
                      }
                    }
                  },
                  icon: Icon(Icons.image)),
            )
          ],
        ),
      );
    });
  }
}
