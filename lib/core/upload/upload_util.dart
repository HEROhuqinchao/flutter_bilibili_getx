import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:image_pickers/image_pickers.dart';
import 'package:light_compressor/light_compressor.dart';
import 'package:path_provider/path_provider.dart';

///上传文件
///压缩文件（压缩视频、压缩图片、选择文件）
class UploadFileUtil {
  final ImagePicker _picker = ImagePicker();

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
      if (response is OnSuccess) {
        ///dio中Multipart文件上传
        final String outputFile = response.destinationPath;
        return MultipartFile.fromFileSync(
          //压缩文件的路径
          outputFile,
          //压缩文件的名称
          filename: videoName,
        );
      } else if (response is OnFailure) {
        SmartDialog.showToast("压缩失败");
      } else if (response is OnCancelled) {
        SmartDialog.showToast("取消压缩");
      }
    } else {
      if (Constant.isDebug) {
        print("文件不存在");
      }
      return null;
    }
    return null;
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

  ///分块文件上传
  uploadChunks({
    required String baseUrl,
    required String path,
    required File file,
    int? chunkSize,
    Map<String, String>? body,
    String? chunkFieldName,
    Map<String, String>? headers,
    String? chunkName,
  }) async {
    ///分块默认1MB大小
    chunkSize = chunkSize ?? 1024 * 1024;
    var sFile = await file.open();

    ///上传部分的大小
    var x = 0;
    var fileSize = file.lengthSync();
    List<int> bytes = [];

    ///当前是第几块
    int chunkId = 0;
    while (x < fileSize) {
      var len = fileSize - x >= chunkSize ? chunkSize : fileSize - x;
      bytes = sFile.readSync(len).toList();
      x += len;

      ///请求上传
      var request = http.MultipartRequest('POST', Uri.parse("$baseUrl$path"));
      chunkId++;

      ///post body体和file块（字节转为分块文件）
      request.fields.addAll(body ?? {});
      request.files.add(http.MultipartFile.fromBytes(
        chunkFieldName ?? 'chunk',
        bytes,
        filename: chunkName ?? "chunk$chunkId",
      ));

      ///请求头
      request.headers.addAll(headers ?? {});
      http.StreamedResponse response = await request.send();
      if (Constant.isDebug) {
        print("-------request begin-------");
        print("URL：$baseUrl$path");
        print("请求方式：POST");
        print("请求头：");
        request.headers.forEach((key, value) {
          print("$key : $value");
        });
        print("参数为$body");
      }

      ///上传结果
      if (response.statusCode == 200) {
        final result = await response.stream.bytesToString();
        print(jsonDecode(result));
      } else {
        print(response.reasonPhrase);
      }
    }
  }

  ///获取分块数
  int getFileChunkNum(File file, int chunkSize) {
    var x = 0;
    var fileSize = file.lengthSync();
    int chunkNum = 0;
    while (x < fileSize) {
      var len = fileSize - x >= chunkSize ? chunkSize : fileSize - x;
      x += len;
      chunkNum++;
    }
    return chunkNum;
  }
}
