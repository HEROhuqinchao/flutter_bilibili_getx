import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_proxy/shelf_proxy.dart';

/**
 * 本地代理，若运行在web端，需要在这个文件下，用命令dart来启动本地代理，处理跨域的问题
 */
import 'constant.dart';

///前端页面访问本地域名
const String LocalHost = '127.0.0.1';

//前端页面访问本地端口号
const int LocalPort01 = 8001;
const int LocalPort02 = 8002;
const int LocalPort03 = 8003;

//目标域名，这里我们将要请求火狐的这个地址
// const String TargetUrl = 'http://api.bilibili.com';

Future main() async {
  var server01 = await shelf_io.serve(
    proxyHandler(Constant.urlMap["live"]!),
    LocalHost,
    LocalPort01,
  );
  // 添加上跨域的这几个header
  server01.defaultResponseHeaders.add('Access-Control-Allow-Origin', '*');
  server01.defaultResponseHeaders.add('Access-Control-Allow-Credentials', true);

  var server02 = await shelf_io.serve(
    proxyHandler(Constant.urlMap["base"]!),
    LocalHost,
    LocalPort02,
  );
  // 添加上跨域的这几个header
  server02.defaultResponseHeaders.add('Access-Control-Allow-Origin', '*');
  server02.defaultResponseHeaders.add('Access-Control-Allow-Credentials', true);

  var server03 = await shelf_io.serve(
    proxyHandler(Constant.urlMap["video"]!),
    LocalHost,
    LocalPort03,
  );
  // 添加上跨域的这几个header
  server03.defaultResponseHeaders.add('Access-Control-Allow-Origin', '*');
  server03.defaultResponseHeaders.add('Access-Control-Allow-Credentials', true);

  print(
      '${Constant.urlMap["live"]} -> Serving at http://${server01.address.host}:${server01.port}');
  print(
      '${Constant.urlMap["base"]} -> Serving at http://${server02.address.host}:${server02.port}');
  print(
      '${Constant.urlMap["video"]} -> Serving at http://${server03.address.host}:${server03.port}');
}
