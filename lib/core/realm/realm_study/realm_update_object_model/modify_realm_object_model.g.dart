// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modify_realm_object_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ModifyRealmObjectModel extends _ModifyRealmObjectModel
    with RealmEntity, RealmObjectBase, RealmObject {
  ModifyRealmObjectModel(
    String groupName,
  ) {
    RealmObjectBase.set(this, 'groupName', groupName);
  }

  ModifyRealmObjectModel._();

  @override
  String get groupName =>
      RealmObjectBase.get<String>(this, 'groupName') as String;
  @override
  set groupName(String value) => RealmObjectBase.set(this, 'groupName', value);

  @override
  Stream<RealmObjectChanges<ModifyRealmObjectModel>> get changes =>
      RealmObjectBase.getChanges<ModifyRealmObjectModel>(this);

  @override
  ModifyRealmObjectModel freeze() =>
      RealmObjectBase.freezeObject<ModifyRealmObjectModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ModifyRealmObjectModel._);
    return const SchemaObject(ObjectType.realmObject, ModifyRealmObjectModel,
        'ModifyRealmObjectModel', [
      SchemaProperty('groupName', RealmPropertyType.string),
    ]);
  }
}

class Person extends _Person with RealmEntity, RealmObjectBase, RealmObject {
  Person(
    String name,
  ) {
    RealmObjectBase.set(this, 'name', name);
  }

  Person._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<Person>> get changes =>
      RealmObjectBase.getChanges<Person>(this);

  @override
  Person freeze() => RealmObjectBase.freezeObject<Person>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Person._);
    return const SchemaObject(ObjectType.realmObject, Person, 'Person', [
      SchemaProperty('name', RealmPropertyType.string),
    ]);
  }
}
