import 'package:realm/realm.dart';

part 'realm_realm_set_model.g.dart';

@RealmModel()
class _RealmRealmSetModel {
  ///字符串Set
  late Set<String> stringSet;

  ///可空Set
  late Set<int?> intSet;

  ///对象Set
  late Set<_SomeRealmModel> objectSet;
}

@RealmModel()
class _SomeRealmModel {
  late ObjectId id;
}
