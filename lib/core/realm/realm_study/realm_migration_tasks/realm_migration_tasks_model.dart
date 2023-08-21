import 'package:realm/realm.dart';

part 'realm_migration_tasks_model.g.dart';

@RealmModel()
class _Person {
  late String firstName;
  late String lastName;
  // late ObjectId id;

  // ///更改id的类型(objectId -> String)
  late String id;
  // ///新增一个属性fullName
  late String fullName;
}
