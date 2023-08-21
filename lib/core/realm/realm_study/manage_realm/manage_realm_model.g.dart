// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ManageRealmModel extends _ManageRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  ManageRealmModel(
    ObjectId id,
    String text, {
    String? model,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'text', text);
    RealmObjectBase.set(this, 'model', model);
  }

  ManageRealmModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get text => RealmObjectBase.get<String>(this, 'text') as String;
  @override
  set text(String value) => RealmObjectBase.set(this, 'text', value);

  @override
  String? get model => RealmObjectBase.get<String>(this, 'model') as String?;
  @override
  set model(String? value) => RealmObjectBase.set(this, 'model', value);

  @override
  Stream<RealmObjectChanges<ManageRealmModel>> get changes =>
      RealmObjectBase.getChanges<ManageRealmModel>(this);

  @override
  ManageRealmModel freeze() =>
      RealmObjectBase.freezeObject<ManageRealmModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ManageRealmModel._);
    return const SchemaObject(
        ObjectType.realmObject, ManageRealmModel, 'ManageRealmModel', [
      SchemaProperty('id', RealmPropertyType.objectid),
      SchemaProperty('text', RealmPropertyType.string),
      SchemaProperty('model', RealmPropertyType.string, optional: true),
    ]);
  }
}
