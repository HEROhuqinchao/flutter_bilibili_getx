import 'package:bilibili_getx/core/sqlite/sqlite_util.dart';

void main() async {
  await SqliteUtil.getInstance("test");

}
