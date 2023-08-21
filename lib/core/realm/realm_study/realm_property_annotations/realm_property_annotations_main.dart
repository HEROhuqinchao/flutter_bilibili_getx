import 'package:bilibili_getx/core/realm/realm_study/realm_property_annotations/realm_property_annotations_model.dart';
import 'package:bilibili_getx/core/realm/realm_util.dart';
import 'package:get/get.dart';
import 'package:realm/realm.dart';

main() {
  RealmUtil().realmInstance?.write<RealmPropertyAnnotationsModel?>(() {
    RealmUtil().realmInstance?.deleteAll<RealmPropertyAnnotationsModel>();
    RealmPropertyAnnotationsModel realmPropertyAnnotations =
        RealmPropertyAnnotationsModel(
      ObjectId(),
      DateTime.now().toString(),
      "text",
      100,
    );
    RealmUtil()
        .realmInstance
        ?.add<RealmPropertyAnnotationsModel>(realmPropertyAnnotations);
    return null;
  });
  RealmResults<RealmPropertyAnnotationsModel>? results =
      RealmUtil().realmInstance?.all<RealmPropertyAnnotationsModel>();
  for (RealmPropertyAnnotationsModel item in results!) {
    print(item.id);
    print(item.defaultValue);
    print(item.quickQueryProperty);
  }
}
