// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_realm_set_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class RealmRealmSetModel extends _RealmRealmSetModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmRealmSetModel({
    Set<String> stringSet = const {},
    Set<int?> intSet = const {},
    Set<SomeRealmModel> objectSet = const {},
  }) {
    RealmObjectBase.set<RealmSet<String>>(
        this, 'stringSet', RealmSet<String>(stringSet));
    RealmObjectBase.set<RealmSet<int?>>(this, 'intSet', RealmSet<int?>(intSet));
    RealmObjectBase.set<RealmSet<SomeRealmModel>>(
        this, 'objectSet', RealmSet<SomeRealmModel>(objectSet));
  }

  RealmRealmSetModel._();

  @override
  RealmSet<String> get stringSet =>
      RealmObjectBase.get<String>(this, 'stringSet') as RealmSet<String>;
  @override
  set stringSet(covariant RealmSet<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmSet<int?> get intSet =>
      RealmObjectBase.get<int?>(this, 'intSet') as RealmSet<int?>;
  @override
  set intSet(covariant RealmSet<int?> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmSet<SomeRealmModel> get objectSet =>
      RealmObjectBase.get<SomeRealmModel>(this, 'objectSet')
          as RealmSet<SomeRealmModel>;
  @override
  set objectSet(covariant RealmSet<SomeRealmModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<RealmRealmSetModel>> get changes =>
      RealmObjectBase.getChanges<RealmRealmSetModel>(this);

  @override
  RealmRealmSetModel freeze() =>
      RealmObjectBase.freezeObject<RealmRealmSetModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(RealmRealmSetModel._);
    return const SchemaObject(
        ObjectType.realmObject, RealmRealmSetModel, 'RealmRealmSetModel', [
      SchemaProperty('stringSet', RealmPropertyType.string,
          collectionType: RealmCollectionType.set),
      SchemaProperty('intSet', RealmPropertyType.int,
          optional: true, collectionType: RealmCollectionType.set),
      SchemaProperty('objectSet', RealmPropertyType.object,
          linkTarget: 'SomeRealmModel',
          collectionType: RealmCollectionType.set),
    ]);
  }
}

class SomeRealmModel extends _SomeRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  SomeRealmModel(
    ObjectId id,
  ) {
    RealmObjectBase.set(this, 'id', id);
  }

  SomeRealmModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  Stream<RealmObjectChanges<SomeRealmModel>> get changes =>
      RealmObjectBase.getChanges<SomeRealmModel>(this);

  @override
  SomeRealmModel freeze() => RealmObjectBase.freezeObject<SomeRealmModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(SomeRealmModel._);
    return const SchemaObject(
        ObjectType.realmObject, SomeRealmModel, 'SomeRealmModel', [
      SchemaProperty('id', RealmPropertyType.objectid),
    ]);
  }
}
