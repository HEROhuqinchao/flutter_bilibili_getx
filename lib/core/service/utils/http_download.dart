// import 'package:dio/dio.dart';
// import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
//
// class HttpDownload {
//   static final Dio _dioInstance = Dio();
//
//   static Future download(
//     String url,
//     String savePath, {
//     // required Map<String, dynamic> queryParams,
//     required CancelToken cancelToken,
//     dynamic data,
//     required void Function(int, int) onReceiveProgress,
//   }) async {
//     try {
//       return await _dioInstance.download(
//         url,
//         savePath,
//         // queryParameters: queryParams,
//         cancelToken: cancelToken,
//         onReceiveProgress: onReceiveProgress,
//       );
//     } on DioError catch (e) {
//       if (CancelToken.isCancel(e)) {
//         SmartDialog.showToast("已取消下载");
//       } else {
//         if (e.response != null) {
//           print(e.response);
//         } else {
//           print(e.message);
//         }
//       }
//     } on Exception catch (e) {
//       print(e.toString());
//     }
//   }
// }
