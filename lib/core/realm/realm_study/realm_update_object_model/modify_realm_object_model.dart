import 'package:realm/realm.dart';

part 'modify_realm_object_model.g.dart';

@RealmModel()
class _ModifyRealmObjectModel {
  late String groupName;
}

@RealmModel()
class _Person {
  late String name;
}