import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../utils/http_base_request.dart';

class DynamicRequest {
  static Future<void> getDynUnLoginRcmdData() async{
    String url = "/bilibili.app.dynamic.v2.Dynamic/DynUnLoginRcmd";
    final responseResult = await HttpBaseRequest.request("app", url,
        contentType: "PROTO", responseType: ResponseType.bytes, method: "POST");
    print(responseResult);
  }
  // static Future<List<DanMuModel02>> getDanMuProtoData(
  //     int oid, int segmentIndex) async {
  //   String url =
  //       "/x/v2/dm/list/seg.so?type=1&oid=${oid}&segment_index=${segmentIndex}";
  //   // print(url);
  //   final responseResult = await HttpBaseRequest.request("base", url,
  //       contentType: "PROTO", responseType: ResponseType.bytes);
  //   // print(responseResult.toString());
  //   Int8List int8Data = Int8List.fromList(responseResult);
  //   DmSegMobileReply danmakuSeg = DmSegMobileReply();
  //   danmakuSeg.mergeFromBuffer(int8Data);
  //
  //   List<DanMuModel02> result = [];
  //   for (int i = 0; i < danmakuSeg.elems.length; i++) {
  //     result.add(DanMuModel02(
  //       //int64
  //       id: danmakuSeg.elems[i].id.toInt(),
  //       progress: danmakuSeg.elems[i].progress,
  //       mode: danmakuSeg.elems[i].mode,
  //       fontsize: danmakuSeg.elems[i].fontsize.toDouble(),
  //       color: danmakuSeg.elems[i].color,
  //       midHash: danmakuSeg.elems[i].midHash,
  //       content: danmakuSeg.elems[i].content,
  //       //int64
  //       ctime: danmakuSeg.elems[i].ctime.toInt(),
  //       weight: danmakuSeg.elems[i].weight,
  //       action: danmakuSeg.elems[i].action,
  //       pool: danmakuSeg.elems[i].pool,
  //       idStr: danmakuSeg.elems[i].idStr,
  //       attr: danmakuSeg.elems[i].attr,
  //     ));
  //   }
  //   return result;
  // }
}