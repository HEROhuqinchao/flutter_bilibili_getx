import 'package:realm/realm.dart';

part 'realm_property_annotations_model.g.dart';

@RealmModel()
class _RealmPropertyAnnotationsModel {
  @PrimaryKey() //主键
  late ObjectId id;
  late String? optionalProperty; //可选参数
  late double defaultValue = 0; //默认数值
  @Ignored() //忽略该属性
  late String ignoreProperty;
  @Indexed() //增加查询该属性的速度
  late String quickQueryProperty;
  @Indexed(RealmIndexType.fullText) //增加查询该属性的速度
  late String fullTextSearch; //全文搜索
  @MapTo('keys') //属性名
  late int numberOfKeys;
}
