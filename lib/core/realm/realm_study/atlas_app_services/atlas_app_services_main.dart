import 'dart:async';

import 'package:graphql/client.dart';
import 'package:realm/realm.dart';

main() {
  ///连接APP Service
  connectAppService();
}

/// 连接APP Service
void connectAppService() {
  String appId = "mytestapplication-iycfu";
  final appConfig = AppConfiguration(
    appId,
    defaultRequestTimeout: const Duration(seconds: 120),
    localAppVersion: '2.0',
  );
  final app = App(appConfig);
  print(app.id);
}

/// 实例化应用程序服务客户端并登录用户
void getAppServiceClientAndLoginUser() async {
  String appId = "mytestapplication-iycfu";
  final app = App(AppConfiguration(appId));
  await app.logIn(Credentials.anonymous());
  Timer.periodic(Duration(minutes: 29), (timer) {
    app.currentUser?.refreshCustomData();
  });

  /// 实例化GraphQL客户端
  const yourGraphQLUrl = "";
  final authLink = AuthLink(getToken: () => 'Bearer ${app.currentUser?.accessToken ?? ""}');
  final link = authLink.concat(HttpLink(yourGraphQLUrl));
  final client = GraphQLClient(link: link, cache: GraphQLCache());
}
