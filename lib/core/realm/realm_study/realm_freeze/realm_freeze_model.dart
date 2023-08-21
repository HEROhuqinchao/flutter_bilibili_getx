import 'package:realm/realm.dart';

part 'realm_freeze_model.g.dart';

@RealmModel()
class _RealmFreezeModel {
  late String text;
  List<String> attributes = [];
}
