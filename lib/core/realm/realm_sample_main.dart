// import 'dart:math';
//
// import 'package:bilibili_getx/core/realm/realm_util.dart';
// import 'package:realm/realm.dart';
//
// main() {
//   ///uuid
//   final myId = Uuid.v4();
//
//   ///objectId
//   final id = ObjectId();
//
//   ///String
//   final String text = "text${DateTime.now().millisecondsSinceEpoch.toString()}";
//
//   ///bool
//   bool state = Random().nextBool();
//
//   ///int
//   int number = Random().nextInt(100);
//
//   ///DateTime
//   DateTime time = DateTime.utc(2023, 8, 4, 12, 0, 0);
//
//   ///可选参数
//   const String textNote = "可选参数";
//
//   ///数据结构
//   PartModel part = PartModel("partId", "partName");
//
//   ///集合
//   final Set<PartModel> partSet = {
//     PartModel("partId01", "partName01"),
//     PartModel("partId02", "partName02"),
//   };
//
//   final schemas = [RealmSampleModel.schema, PartModel.schema];
//
//   final sampleData = RealmSampleModel(myId, id, text, state, number, time,
//       textNote: textNote, part: part, partSet: partSet);
//
//   ///新增
//   RealmUtil(schemas).addRealm(sampleData);
//
//   ///修改
//   RealmList<String> realmList = sampleData.dataList;
//   RealmSet realmSet = sampleData.partSet;
//   RealmUtil(schemas).modifyRealm(() {
//     ///realmList
//     realmList.add("textOne");
//     realmList.remove("textTwo");
//     ///realmSet
//     realmSet.add(PartModel("partId_remove", "partName_remove"));
//     realmSet.add(PartModel("partId_add", "partName_add"));
//     realmSet.remove(PartModel("partId_remove", "partName_remove"));
//   });
//
//   ///查询所有记录
//   final result = RealmUtil(schemas).queryRealm<RealmSampleModel>();
//   printResult(result as RealmResults<Object?>);
//
//   ///按条件查询记录(查询数字大于0的数据项）
//   final queryResult = RealmUtil(schemas)
//       .queryRealm<RealmSampleModel>(query: r'number > $0 LIMIT(2)', args: [50]);
//   printResult(queryResult as RealmResults<Object?>);
//
//   RealmUtil(schemas).deleteItem<RealmSampleModel>(sampleData);
//
//   RealmUtil(schemas).closeRealm();
// }
//
// void printResult(RealmResults results) {
//   int i = 0;
//   for (var data in results) {
//     if (data is RealmSampleModel) {
//       print("第$i数据项");
//       print("uuid(Uuid) is ${data.uuid}");
//       print("id(ObjectId) is ${data.id}");
//       print("text(String) is ${data.text}");
//       print("state(bool) is ${data.state}");
//       print("number(int) is ${data.number}");
//       print("time(DateTime) is ${data.time}");
//       print("part(PartModel) is ${data.part}");
//       print("set(Set<PartModel>) is ${data.partSet}");
//       print("//////////////////////////");
//     }
//     i++;
//   }
// }
