import 'package:bilibili_getx/core/realm/realm_study/realm_realmSet/realm_realm_set_model.dart';
import 'package:bilibili_getx/core/realm/realm_util.dart';
import 'package:realm/realm.dart';

main() {
  final SomeRealmModel someRealm = SomeRealmModel(ObjectId());

  ///新增
  RealmUtil().realmInstance?.write<RealmRealmSetModel>(() {
    RealmUtil().realmInstance?.deleteAll<RealmRealmSetModel>();
    RealmRealmSetModel? realmRealmSet =
        RealmUtil().realmInstance?.add(RealmRealmSetModel(
              stringSet: {"apple", "banana"},
              intSet: {0, 1},
              objectSet: {someRealm},
            ));
    return realmRealmSet!;
  });

  ///修改
  ///{apple, banana, orange}
  // {null, 0, 1}
  // {Instance of 'SomeRealmModel', Instance of 'SomeRealmModel'}
  final res = RealmUtil().realmInstance?.all<RealmRealmSetModel>();
  RealmUtil().realmInstance?.write<RealmRealmSetModel?>(() {
    res?.first.stringSet.add("orange");
    res?.first.intSet.add(null);
    res?.first.objectSet.add(SomeRealmModel(ObjectId()));
    return null;
  });

  ///查询
  final queryRes = RealmUtil().realmInstance?.all<RealmRealmSetModel>();
  for (var item in queryRes!) {
    print(item.stringSet.toString());
    print(item.intSet.toString());
    print(item.objectSet.toString());
  }
}
