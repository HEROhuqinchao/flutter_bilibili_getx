import 'package:realm/realm.dart';

part 'realm_realm_list_model.g.dart';

@RealmModel()
class _RealmRealmListModel {
  late List<String> dataList; //数据列表
  late List<_Item> itemList; //对象列表
}

@RealmModel()
class _Item {
  @PrimaryKey()
  late ObjectId id;
  late String name;
}