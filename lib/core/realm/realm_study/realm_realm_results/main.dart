import 'package:bilibili_getx/core/realm/realm_study/realm_model/realm_model_data_model.dart';
import 'package:bilibili_getx/core/realm/realm_study/realm_realmList/realm_realm_list_model.dart';
import 'package:bilibili_getx/core/realm/realm_study/realm_realmSet/realm_realm_set_model.dart';
import 'package:bilibili_getx/core/realm/realm_util.dart';
import 'package:realm/realm.dart';

main() {
  ///查询所有
  RealmResults<RealmRealmSetModel>? results =
      RealmUtil().realmInstance?.all<RealmRealmSetModel>();

  //新增测试数据
  RealmUtil().realmInstance?.write<RealmModelDataModel?>(() {
    RealmUtil().realmInstance?.deleteAll<RealmModelDataModel>();
    RealmUtil().realmInstance?.add<RealmModelDataModel>(RealmModelDataModel(
          Uuid.v4(),
          id: ObjectId(),
          text: "hello Realm",
          state: true,
          number: 1,
          time: DateTime.now(),
          textNote: "123",
        ));
    return null;
  });

  ///按条件查询
  RealmResults<RealmModelDataModel>? queryResult = RealmUtil()
      .realmInstance
      ?.query<RealmModelDataModel>(r'state == $0', [true]);

  ///{apple, banana, orange}
  // {null, 0, 1}
  // {Instance of 'SomeRealmModel', Instance of 'SomeRealmModel'}
  print("所有结果");
  for (var item in results!) {
    print(item.stringSet);
    print(item.intSet);
    print(item.objectSet);
  }

  ///hello Realm
  print("条件查询");
  for (var item in queryResult!) {
    print(item.text);
  }
}
