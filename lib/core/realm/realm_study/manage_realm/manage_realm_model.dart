import 'package:realm/realm.dart';

part 'manage_realm_model.g.dart';

@RealmModel()
class _ManageRealmModel {
  late ObjectId id;
  late String text;
  String? model;
}
