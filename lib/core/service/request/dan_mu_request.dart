import 'dart:typed_data';

import 'package:dio/dio.dart';
import '../../model/dan_mu_model_02.dart';
import '../../proto/dm.pb.dart';
import '../utils/http_base_request.dart';

class HYDanMuRequest {
  /**
   * 网络请求xml数据有问题，先使用静态数据
   */
  // static Future<String> getDanMuData(int oid) async {
  //   final url = "/v1/dm/list.so?oid=${oid}";
  //   var result = await HttpBaseRequest.request(url, contentType: "XML");
  //   // print(transformerXmlToJson(result));
  //   return result;
  //   // return HYRelationStatModel.fromJson(result);
  // }

  /// 这里使用静态的数据，不使用网络请求
  // static Future<List<String>> getDanMuData() async {
  //   final document = XmlDocument.parse(xmlTest);
  //   final xmlString = document.toXmlString(pretty: true, indent: '\t');
  //   String xmlJson = transformerXmlToJson(xmlString);
  //   final danMuData = (convert.jsonDecode(xmlJson))["i"]["d"];
  //
  //   ///本来要转换为对象存储，但是就一个本文String，那就直接存储在list中就行了
  //   List<String> danMuList = [];
  //   for (var i in danMuData) {
  //     danMuList.add(i);
  //   }
  //   return danMuList;
  // }

  HYDanMuRequest._internal();

  static final HYDanMuRequest _instance = HYDanMuRequest._internal();

  factory HYDanMuRequest() => _instance;

  /// 新版本 弹幕 protobuf格式的数据
  /// 不再使用XML的数据弹幕数据，改用请求proto格式的弹幕数据
  Future<List<DanMuModel02>> getDanMuProtoData(
      String oid, int segmentIndex) async {
    String url =
        "/x/v2/dm/list/seg.so?type=1&oid=$oid&segment_index=$segmentIndex";
    // print(url);
    final responseResult = await HttpBaseRequest().request("base", url,
        contentType: "PROTO", responseType: ResponseType.bytes);
    // print(responseResult.toString());
    Int8List int8Data = Int8List.fromList(responseResult);
    DmSegMobileReply danmakuSeg = DmSegMobileReply();
    danmakuSeg.mergeFromBuffer(int8Data);

    List<DanMuModel02> result = [];
    for (int i = 0; i < danmakuSeg.elems.length; i++) {
      result.add(DanMuModel02(
        //int64
        id: danmakuSeg.elems[i].id.toInt(),
        progress: danmakuSeg.elems[i].progress,
        mode: danmakuSeg.elems[i].mode,
        fontsize: danmakuSeg.elems[i].fontsize.toDouble(),
        color: danmakuSeg.elems[i].color,
        midHash: danmakuSeg.elems[i].midHash,
        content: danmakuSeg.elems[i].content,
        //int64
        ctime: danmakuSeg.elems[i].ctime.toInt(),
        weight: danmakuSeg.elems[i].weight,
        action: danmakuSeg.elems[i].action,
        pool: danmakuSeg.elems[i].pool,
        idStr: danmakuSeg.elems[i].idStr,
        attr: danmakuSeg.elems[i].attr,
      ));
    }
    return result;
  }
}
