import 'package:realm/realm.dart';

part 'realm_read_write_model.g.dart';

@RealmModel()
class _Person {
  ///主键
  @PrimaryKey()
  late ObjectId id;
  late String name;
}

@RealmModel()
class _Team {
  ///主键
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late List<_Person> crew;
}

@RealmModel()
class _Rug {
  ///全文搜索
  @Indexed(RealmIndexType.fullText)
  late String pattern;
  @Indexed(RealmIndexType.fullText)
  late String material;
}
