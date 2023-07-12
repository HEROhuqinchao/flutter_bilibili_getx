import 'dart:convert';
import 'dart:io';

import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
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

  ///分块文件上传
  ///https://blog.csdn.net/weixin_43223804/article/details/113563831
  ///录制视频
  Future<XFile?> getVideo() async {
    final XFile? file = await _picker.pickVideo(
      source: ImageSource.camera,
      maxDuration: const Duration(seconds: 60),
    );
    return file;
  }

  ///选择手机上的视频
  // Future<List<Media>> chooseVideo() async {
  //   List<Media> videos = await ImagePickers.pickerPaths(
  //     galleryMode: GalleryMode.video,
  //     selectCount: 1,
  //   );
  //   return videos;
  // }

  ///获取分块文件
  getFileChunks(String filePath, String url) async {
    File file = File(filePath);
    var sFile = await file.open();
    var x = 0;
    var fileSize = file.lengthSync();
    var chunkSize = 1000000;
    List<int> val;
    while (x < fileSize) {
      var isLast = fileSize - x >= chunkSize ? 'no' : 'yes';
      var httpClient = HttpClient();
      var request = await httpClient.postUrl(Uri.parse(url));
      var len = fileSize - x >= chunkSize ? chunkSize : fileSize - x;
      val = sFile.readSync(len).toList();
      x = x + len;
      request.add(val);
      await request.flush();
      print(len);
      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();
      if (json.decode(responseBody)["code"] == 0) {
        await sFile.close();
        print("上传完成");
      }
    }
  }
}
