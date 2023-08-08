import 'dart:math';

import 'package:bilibili_getx/core/realm/realm_study/realm_model/realm_model_data_model.dart';
import 'package:realm/realm.dart';

void main() {
  ///uuid唯一标识
  final myId = Uuid.v4();

  ///objectId唯一标识
  final id = ObjectId();

  ///String
  final String text = "text${DateTime.now().millisecondsSinceEpoch.toString()}";

  ///bool
  bool state = Random().nextBool();

  ///int
  int number = Random().nextInt(100);

  ///DateTime
  DateTime time = DateTime.utc(2023, 8, 4, 12, 0, 0);

  ///可选参数
  const String textNote = "可选参数";

  ///数据结构
  PartModel part = PartModel("partId", "partName");

  ///集合
  final Set<PartModel> partSet = {
    PartModel("partId01", "partName01"),
    PartModel("partId02", "partName02"),
  };

  final schemas = [RealmModelDataModel.schema, PartModel.schema];

  final sampleData = RealmModelDataModel(myId, id, text, state, number, time,
      textNote: textNote, part: part, partSet: partSet);
}
