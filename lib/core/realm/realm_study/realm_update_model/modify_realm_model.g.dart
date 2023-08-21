// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modify_realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ModifyRealmModel extends _ModifyRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  ModifyRealmModel(
    String firstName,
    String lastName,
  ) {
    RealmObjectBase.set(this, 'firstName', firstName);
    RealmObjectBase.set(this, 'lastName', lastName);
  }

  ModifyRealmModel._();

  @override
  String get firstName =>
      RealmObjectBase.get<String>(this, 'firstName') as String;
  @override
  set firstName(String value) => RealmObjectBase.set(this, 'firstName', value);

  @override
  String get lastName =>
      RealmObjectBase.get<String>(this, 'lastName') as String;
  @override
  set lastName(String value) => RealmObjectBase.set(this, 'lastName', value);

  @override
  Stream<RealmObjectChanges<ModifyRealmModel>> get changes =>
      RealmObjectBase.getChanges<ModifyRealmModel>(this);

  @override
  ModifyRealmModel freeze() =>
      RealmObjectBase.freezeObject<ModifyRealmModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ModifyRealmModel._);
    return const SchemaObject(
        ObjectType.realmObject, ModifyRealmModel, 'ModifyRealmModel', [
      SchemaProperty('firstName', RealmPropertyType.string),
      SchemaProperty('lastName', RealmPropertyType.string),
    ]);
  }
}
