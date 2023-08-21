import 'package:bilibili_getx/core/realm/realm_study/read_write_realm/realm_read_write_model.dart';
import 'package:bilibili_getx/core/realm/realm_study/realm_freeze/realm_freeze_model.dart';
import 'package:bilibili_getx/core/realm/realm_study/realm_listener/realm_listener_model.dart';
import 'package:bilibili_getx/core/realm/realm_study/realm_model/realm_model_data_model.dart';
import 'package:bilibili_getx/core/realm/realm_study/realm_property_annotations/realm_property_annotations_model.dart';
import 'package:bilibili_getx/core/realm/realm_study/realm_realmList/realm_realm_list_model.dart';
import 'package:bilibili_getx/core/realm/realm_study/realm_realmSet/realm_realm_set_model.dart';
import 'package:realm/realm.dart';

// mongodb realm 跨平台数据库
class RealmUtil {
  RealmUtil._internal();

  static final RealmUtil _instance = RealmUtil._internal();
  static late LocalConfiguration? config = null;
  static late Realm? _realm = null;

  factory RealmUtil() {
    ///注册schema
    Configuration.defaultRealmName = "realmVersion_1_0_0.realm";
    int schemaVersion = 1;
    List<SchemaObject> schemaObjects = [
      RealmRealmListModel.schema,
      RealmRealmSetModel.schema,
      SomeRealmModel.schema,
      Item.schema,
      RealmModelDataModel.schema,
      PartModel.schema,
      RealmPropertyAnnotationsModel.schema,
      Person.schema,
      Team.schema,
      Rug.schema,
      Character.schema,
      Fellowship.schema,
      RealmFreezeModel.schema,
    ];
    if (_realm == null) {
      config = Configuration.local(schemaObjects, schemaVersion: schemaVersion);
      _realm = Realm(config!);
    } else if (_realm?.schema.length != schemaObjects.length) {
      config = Configuration.local(schemaObjects, schemaVersion: schemaVersion);
      _realm = Realm(config!);
    } else {
      config ??=
          Configuration.local(schemaObjects, schemaVersion: schemaVersion);
      _realm ??= Realm(config!);
    }
    return _instance;
  }

  Realm? get realmInstance => _realm;
}
