import 'dart:typed_data';

import 'package:realm/realm.dart';

part 'realm_model_data_model.g.dart';

@RealmModel()
class _RealmModelDataModel {
  @PrimaryKey() //主键
  late Uuid uuid; //16Bytes的唯一值
  ObjectId? id; //mongodb特有的12Bytes唯一值
  @Indexed()
  late RealmValue singleAnyValue; //任意类型数据
  late List<RealmValue> listOfMixedAnyValues; //任意数据集合
  late String? text; //字符串
  late bool? state; //布尔
  late int? number; //整型
  late DateTime? time; //时间
  late List<String> dataList; //数据列表
  late Set<_PartModel> partSet; //set集合
  String? textNote; //可选参数
  _PartModel? part; //引用其他模型
  Uint8List? binaryList; //8位整型数组
}

@RealmModel()
class _PartModel {
  late String partId;
  late String partName;
}
