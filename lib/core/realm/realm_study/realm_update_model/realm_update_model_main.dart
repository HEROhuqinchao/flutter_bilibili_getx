import 'package:bilibili_getx/core/realm/realm_study/realm_update_model/modify_realm_model.dart';
import 'package:realm/realm.dart';

main() {
  final config = Configuration.local(
    [ModifyRealmModel.schema],
    // schemaVersion: 1,
    // schemaVersion: 2, //更新版本
    schemaVersion: 3, //更新版本
  );
  final realm = Realm(config);
  realm.write<ModifyRealmModel?>(() {
    realm.add<ModifyRealmModel>(ModifyRealmModel("james", "jock"));
    return null;
  });
  // james
  // jock
  // james
  // jock
  // james
  // jock
  RealmResults<ModifyRealmModel> results = realm.all<ModifyRealmModel>();
  for (var item in results) {
    print(item.firstName);
    print(item.lastName);
    // print(item.age);
  }
}
