import 'package:bilibili_getx/core/realm/realm_study/realm_model/realm_model_data_model.dart';
import 'package:bilibili_getx/core/realm/realm_util.dart';
import 'package:realm/realm.dart';

void main() {
  ///RealmValue任意数据类型
  final RealmValue realmValueOne = RealmValue.from(1);
  final List<RealmValue> realmValueListOne =
      ["abc", 123].map(RealmValue.from).toList();
  const RealmValue realmValueTwo = RealmValue.nullValue();
  final List<RealmValue> realmValueListTwo =
      ["abc", 123].map(RealmValue.from).toList();
  final sampleDataOne = RealmModelDataModel(
    Uuid.v4(),
    singleAnyValue: realmValueOne,
    listOfMixedAnyValues: realmValueListOne,
  );
  final sampleDataTwo = RealmModelDataModel(
    Uuid.v4(),
    singleAnyValue: realmValueTwo,
    listOfMixedAnyValues: realmValueListTwo,
  );

  ///写入
  RealmUtil().realmInstance?.write<RealmModelDataModel?>(() {
    RealmUtil().realmInstance?.deleteAll<RealmModelDataModel>();
    RealmUtil().realmInstance?.add<RealmModelDataModel>(sampleDataOne);
    RealmUtil().realmInstance?.add<RealmModelDataModel>(sampleDataTwo);
    return null;
  });

  ///读取
  // 1
  // [abc, 123]
  // [String, int]
  // null
  // [abc, 123]
  // [String, int]
  RealmResults<RealmModelDataModel> results =
      RealmUtil().realmInstance!.all<RealmModelDataModel>();
  for (RealmModelDataModel item in results) {
    print(item.singleAnyValue.value);
    ///获取数据
    print(item.listOfMixedAnyValues.map((e) => e.value).toList().toString());
    ///获取数据类型
    print(item.listOfMixedAnyValues.map((e) => e.type).toList().toString());
  }
}
