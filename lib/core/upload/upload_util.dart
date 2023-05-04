import 'dart:io';

import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:light_compressor/light_compressor.dart';
import 'package:path_provider/path_provider.dart';

///上传文件
///压缩文件（压缩视频、压缩图片）
class UploadFileUtil {
  ///压缩视频
  Future<MultipartFile?> compressVideo(
      {required String videoName, File? file}) async {
    if (file?.existsSync() == true) {
      final response = await LightCompressor().compressVideo(
        path: file!.path,
        videoQuality: VideoQuality.low,
        isMinBitrateCheckEnabled: false,
        video: Video(videoName: videoName),
        android:
            AndroidConfig(isSharedStorage: false, saveAt: SaveAt.Downloads),
        ios: IOSConfig(saveInGallery: false),
      );

      ///dio中Multipart文件上传
      return MultipartFile.fromFileSync(
        //压缩文件的路径
        response.destinationPath,
        //压缩文件的名称
        filename: videoName,
      );
    } else {
      if (Constant.isDebug) {
        print("文件不存在");
      }
      return null;
    }
  }

  ///获取文件大小
  int getFileSizeFromPath(String path) {
    File? file = File(path);
    if (file.existsSync()) {
      return File(path).lengthSync();
    } else {
      if (Constant.isDebug) {
        print("文件不存在");
      }
      return 0;
    }
  }

  ///压缩图片文件(压缩文件存储在临时路径中）
  compressPhoto({required String photoName, File? file}) async {
    if (file?.existsSync() == true) {
      File? response = await FlutterImageCompress.compressAndGetFile(
        file!.path,
        "${(await getTemporaryDirectory()).path}/$photoName",
        quality: 50,
        format: CompressFormat.jpeg,
      );
      return MultipartFile.fromFileSync(
        response!.path,
        filename: photoName,
      );
    } else {
      if (Constant.isDebug) {
        print("文件不存在");
      }
      return null;
    }
  }
}
