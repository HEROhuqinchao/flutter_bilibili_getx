import 'package:bilibili_getx/core/realm/realm_study/realm_realmList/realm_realm_list_model.dart';
import 'package:bilibili_getx/core/realm/realm_util.dart';
import 'package:realm/realm.dart';

void main() {
  final sampleData = RealmRealmListModel(dataList: ["0", "dirty", "2", "3"]);

  ///新增一个列表
  RealmUtil().realmInstance?.write(() {
    RealmUtil().realmInstance?.deleteAll<RealmRealmListModel>();
    RealmUtil().realmInstance?.add<RealmRealmListModel>(sampleData);
  });

  ///修改列表
  RealmResults<RealmRealmListModel>? results = RealmUtil().realmInstance?.all();
  RealmUtil().realmInstance?.write(() {
    results?.first.dataList.remove("dirty");
    results?.first.dataList[0] = "1";
    results?.first.dataList.add("4");
  });

  ///查看列表
  final res = RealmUtil().realmInstance?.all<RealmRealmListModel>();
  ///[1, 2, 3, 4]
  print(res?.toList().first.dataList.toString());
}