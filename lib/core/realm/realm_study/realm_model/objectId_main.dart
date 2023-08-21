import 'package:bilibili_getx/core/realm/realm_study/realm_model/realm_model_data_model.dart';
import 'package:bilibili_getx/core/realm/realm_util.dart';
import 'package:realm/realm.dart';

main() {
  RealmUtil().realmInstance?.write<RealmModelDataModel?>(() {
    RealmUtil().realmInstance?.deleteAll<RealmModelDataModel>();
    RealmUtil().realmInstance?.add<RealmModelDataModel>(
        RealmModelDataModel(Uuid.v4(), id: ObjectId()));
    return null;
  });
  RealmResults<RealmModelDataModel>? results =
      RealmUtil().realmInstance?.all<RealmModelDataModel>();
  // b8193aa2-80f1-4922-b0fe-36beeda778c1
  // 64d9e645e5f9c0b1b84ef903
  for (var item in results!) {
    print(item.uuid);
    print(item.id);
  }
}