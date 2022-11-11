import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_proxy/shelf_proxy.dart';

/**
 * 本地代理，若运行在web端，需要在这个文件下，用命令dart来启动本地代理，处理跨域的问题
 */
import '../service/utils/constant.dart';

///前端页面访问本地域名
const String LocalHost = '127.0.0.1';

//前端页面访问本地端口号
const int localPort02 = 8002;
const int localPort01 = 8001;
const int localPort03 = 8003;
const int localPort04 = 8004;
const int localPort05 = 8005;
const int localPort06 = 8006;
const int localPort07 = 8007;
const int localPort08 = 8008;
const int localPort09 = 8009;

Future main() async {
  var server01 = await shelf_io.serve(
    proxyHandler(Constant.urlMap["live"]!),
    LocalHost,
    localPort01,
  );
  server01.defaultResponseHeaders.add('Access-Control-Allow-Origin', '*');
  server01.defaultResponseHeaders.add('Access-Control-Allow-Credentials', true);

  var server02 = await shelf_io.serve(
    proxyHandler(Constant.urlMap["base"]!),
    LocalHost,
    localPort02,
  );
  server02.defaultResponseHeaders.add('Access-Control-Allow-Origin', '*');
  server02.defaultResponseHeaders.add('Access-Control-Allow-Credentials', true);

  var server03 = await shelf_io.serve(
    proxyHandler(Constant.urlMap["video"]!),
    LocalHost,
    localPort03,
  );
  server03.defaultResponseHeaders.add('Access-Control-Allow-Origin', '*');
  server03.defaultResponseHeaders.add('Access-Control-Allow-Credentials', true);

  var server04 = await shelf_io.serve(
    proxyHandler(Constant.urlMap["login"]!),
    LocalHost,
    localPort04,
  );
  server04.defaultResponseHeaders.add('Access-Control-Allow-Origin', '*');
  server04.defaultResponseHeaders.add('Access-Control-Allow-Credentials', true);

  var server05 = await shelf_io.serve(
    proxyHandler(Constant.urlMap["mall"]!),
    LocalHost,
    localPort05,
  );
  server05.defaultResponseHeaders.add('Access-Control-Allow-Origin', '*');
  server05.defaultResponseHeaders.add('Access-Control-Allow-Credentials', true);

  var server06 = await shelf_io.serve(
    proxyHandler(Constant.urlMap["search"]!),
    LocalHost,
    localPort06,
  );
  server06.defaultResponseHeaders.add('Access-Control-Allow-Origin', '*');
  server06.defaultResponseHeaders.add('Access-Control-Allow-Credentials', true);

  var server07 = await shelf_io.serve(
    proxyHandler(Constant.urlMap["app"]!),
    LocalHost,
    localPort07,
  );
  server07.defaultResponseHeaders.add('Access-Control-Allow-Origin', '*');
  server07.defaultResponseHeaders.add('Access-Control-Allow-Credentials', true);

  var server08 = await shelf_io.serve(
    proxyHandler(Constant.urlMap["mall-web"]!),
    LocalHost,
    localPort08,
  );
  server08.defaultResponseHeaders.add('Access-Control-Allow-Origin', '*');
  server08.defaultResponseHeaders.add('Access-Control-Allow-Credentials', true);

  var server09 = await shelf_io.serve(
    proxyHandler(Constant.urlMap["covid"]!),
    LocalHost,
    localPort09,
  );
  server08.defaultResponseHeaders.add('Access-Control-Allow-Origin', '*');
  server08.defaultResponseHeaders.add('Access-Control-Allow-Credentials', true);

  print(
      '${Constant.urlMap["live"]} -> live Serving at http://${server01.address.host}:${server01.port}');
  print(
      '${Constant.urlMap["base"]} -> base Serving at http://${server02.address.host}:${server02.port}');
  print(
      '${Constant.urlMap["video"]} -> video Serving at http://${server03.address.host}:${server03.port}');
  print(
      '${Constant.urlMap["login"]} -> login Serving at http://${server04.address.host}:${server04.port}');
  print(
      '${Constant.urlMap["mall"]} -> mall Serving at http://${server05.address.host}:${server05.port}');
  print(
      '${Constant.urlMap["search"]} -> search Serving at http://${server06.address.host}:${server06.port}');
  print(
      '${Constant.urlMap["app"]} -> app Serving at http://${server07.address.host}:${server07.port}');
  print(
      '${Constant.urlMap["mall-web"]} -> mall-web Serving at http://${server08.address.host}:${server08.port}');
  print(
      '${Constant.urlMap["covid"]} -> covid Serving at http://${server09.address.host}:${server09.port}');
}
