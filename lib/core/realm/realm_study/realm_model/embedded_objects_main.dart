import 'package:bilibili_getx/core/realm/realm_study/realm_model/realm_model_data_model.dart';
import 'package:bilibili_getx/core/realm/realm_util.dart';
import 'package:realm/realm.dart';

///存储对象
main() {
  RealmUtil().realmInstance?.write<RealmModelDataModel?>(() {
    RealmModelDataModel realmModelData = RealmModelDataModel(
      Uuid.v4(),
      part: PartModel("part001", "partOne"),
    );
    RealmUtil().realmInstance?.deleteAll<RealmModelDataModel>();
    RealmUtil().realmInstance?.add<RealmModelDataModel>(realmModelData);
    return null;
  });
  final RealmResults<RealmModelDataModel>? results =
      RealmUtil().realmInstance?.all<RealmModelDataModel>();
  // partId: part001
  // partName: partOne
  for (var item in results!) {
    print("partId: ${item.part?.partId}");
    print("partName: ${item.part?.partName}");
  }
}
