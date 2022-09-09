import 'package:bilibili_getx/ui/pages/video_play/video_play_logic.dart';
import 'package:bilibili_getx/ui/pages/video_play/video_play_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

import '../../core/router/router.dart';
import '../../core/service/request/video_play_request.dart';

void main() async {
  Get.put(VideoPlayLogic());
  runApp(MyTestApp());
  // VideoApi.getVideoPlayUrlV3("471469842", 786964408);
  // VideoApi.getVideoDetail("471469842");
  // var headers = {
  //   'User-Agent': 'Mozilla/5.0 (Linux; Android 5.1.1; Android SDK built for x86 Build/LMY48X) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/39.0.0.0 Mobile Safari/537.36',
  //   'Cookie': 'b_nut=100; buvid3=177129A4-8992-D5DD-B1AA-3827674022DC63104infoc'
  // };
  // var request = http.Request('GET', Uri.parse('https://m.bilibili.com/video/av471469842.html?from=search'));
  //
  // request.headers.addAll(headers);
  //
  // http.StreamedResponse response = await request.send();
  //
  // if (response.statusCode == 200) {
  //   print(await response.stream.bytesToString());
  // }
  // else {
  //   print(response.reasonPhrase);
  // }
}
class MyTestApp extends StatelessWidget {
  const MyTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: VideoPlayScreen(),
      ),
      getPages: AsRouter.getPages,
    );
  }
}


// class VideoApi{
//   static getVideoPlayUrl(String aid,{int page=1})async{
//     String url="http://api.bilibili.com/playurl?aid=$aid&platform=html5&quality=3&vtype=mp4&type=jsonp&page=$page";
//     Dio dio=Dio();
//     try{
//       Response res=await dio.get(url,options: Options(
//           headers: {"Cookie":"buvid3=5410244B-513B-4AB8-98AC-0B6F466E36A3190966infoc"}
//       ));
//
//       if(res.data["durl"]["0"]["url"]!=null){
//         print(res.data["durl"]["0"]["url"]);
//       }
//       return null;
//     }
//     catch(e){
//       print(e.toString());
//       print("获取播放列表失败");
//       return null;
//     }
//
//   }
//   static getVideoPlayUrlV2(int cid,{int qn=64})async{
//     String appserct="aHRmhWMLkdeMuILqORnYZocwMBpMEOdt";
//     String path="https://app.bilibili.com/playurl";
//     String data="appkey=iVGUTjsxvpLeuDCf&build=500001&buvid=C0928256-085D-4722-A38F-2E343710C8B3155817infoc&cid=$cid&device=android&otype=json&platform=android&qn=$qn";
//     String sign=md5.convert(utf8.encode(data+appserct)).toString();
//     String url="$path?$data&sign=$sign";
//     Dio dio=Dio();
//     try{
//       Response res=await dio.get(url,
//           options: Options(
//               responseType: ResponseType.json
//           ));
//       if(res.data["durl"][0]["url"]!=null){
//         return res.data["durl"][0]["url"];
//       }
//       return null;
//     }
//     catch(e){
//       print(e.toString());
//       print("获取视频播放地址失败");
//       return null;
//     }
//   }
//
//   static getVideoPlayUrlV3(String aid,int cid,{int qn=64})async{
//     String appserct="aHRmhWMLkdeMuILqORnYZocwMBpMEOdt";
//     String path="https://app.bilibili.com/x/playurl";
//     int ts=DateTime.now().millisecondsSinceEpoch;
//     String data="actionkey=appkey&aid=$aid&appkey=iVGUTjsxvpLeuDCf&build=5490400&buvid=XZF9F55FE566C57599024A397F5F160E74DBE&cid=$cid&device=android&expire=0&fnval=16&fnver=0&force_host=0&fourk=0&from_spmid=tm.recommend.0.0&mid=0&mobi_app=android&otype=json&platform=android&qn=$qn&spmid=main.ugc-video-detail.0.0&ts=$ts";
//     String sign=md5.convert(utf8.encode(data+appserct)).toString();
//     String url="$path?$data&sign=$sign";
//     Dio dio=Dio();
//     print((url));
//     // try{
//     //   Response res=await dio.get(url,
//     //       options: Options(
//     //           responseType: ResponseType.json
//     //       ));
//     //   if(res.data["data"]["dash"]!=null){
//     //     String vl;
//     //     for(Map<String,dynamic> jd in res.data["data"]["dash"]["video"]){
//     //       if(jd["id"]==qn){
//     //         vl=jd["base_url"];
//     //         break;
//     //       }
//     //     }
//     //     vl= res.data["data"]["dash"]["video"][0]["base_url"];
//     //
//     //     String al=res.data["data"]["dash"]["audio"][0]["base_url"];
//     //     print({"video_url":vl,"audio_url":al});
//     //   }
//     //   else if(res.data["data"]["durl"]!=null){
//     //     String vl=res.data["data"]["durl"][0]["url"];
//     //     return {"video_url":vl,"audio_url":null};
//     //   }
//     //   return null;
//     // }
//     // catch(e){
//     //   print(e.toString());
//     //   print("获取视频播放地址失败");
//     //   return null;
//     // }
//   }
//
//   static getVideoDetail(String aid)async{
//     String appserct="560c52ccd288fed045859ed18bffd973";
//     String path="https://app.bilibili.com/x/v2/view";
//     String data="aid=$aid&appkey=1d8b6e7d45233436&build=5480400&ts=${DateTime.now().millisecondsSinceEpoch}";
//     String sign=md5.convert(utf8.encode(data+appserct)).toString();
//     String url="$path?$data&sign=$sign";
//     print(url);
//     Dio dio=Dio();
//     // try{
//     //   Response res=await dio.get(url,options: Options(
//     //       sendTimeout: 5000
//     //   ));
//     //   if(res.data["code"]==0){
//     //     print(res.data);
//     //     // VideoDetailItem videoDetailItem=VideoDetailItem.fromJson(res.data);
//     //     // return videoDetailItem;
//     //   }
//     //   return res.data["code"];
//     // }
//     // catch(e){
//     //   print(e.toString());
//     //   print("获取视频详情");
//     //   return null;
//     // }
//
//   }
// }