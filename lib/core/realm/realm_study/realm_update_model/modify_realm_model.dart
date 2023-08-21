import 'package:realm/realm.dart';

part 'modify_realm_model.g.dart';

@RealmModel()
class _ModifyRealmModel {
  late String firstName;
  late String lastName;

  /// 修改RealmModel的属性
  // late int age;
}
