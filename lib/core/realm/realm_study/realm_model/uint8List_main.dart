import 'dart:typed_data';

import 'package:bilibili_getx/core/realm/realm_study/realm_model/realm_model_data_model.dart';
import 'package:bilibili_getx/core/realm/realm_util.dart';
import 'package:realm/realm.dart';

main() {
  RealmUtil().realmInstance?.write<RealmModelDataModel?>(() {
    RealmUtil().realmInstance?.deleteAll<RealmModelDataModel>();
    RealmUtil().realmInstance?.add<RealmModelDataModel>(RealmModelDataModel(
          Uuid.v4(),
          binaryList: Uint8List.fromList([1, 2]), //八位整型数组,realm1.3.0以上支持
        ));
    return null;
  });
  RealmResults<RealmModelDataModel>? results =
      RealmUtil().realmInstance?.all<RealmModelDataModel>();
  // e126c56d-77f1-4a6f-abf8-2ce48de340c8
  // [1, 2]
  for (var item in results!) {
    print(item.uuid);
    print(item.binaryList);
  }
}
