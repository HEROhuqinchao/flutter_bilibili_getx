// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_realm_list_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class RealmRealmListModel extends _RealmRealmListModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmRealmListModel({
    Iterable<String> dataList = const [],
    Iterable<Item> itemList = const [],
  }) {
    RealmObjectBase.set<RealmList<String>>(
        this, 'dataList', RealmList<String>(dataList));
    RealmObjectBase.set<RealmList<Item>>(
        this, 'itemList', RealmList<Item>(itemList));
  }

  RealmRealmListModel._();

  @override
  RealmList<String> get dataList =>
      RealmObjectBase.get<String>(this, 'dataList') as RealmList<String>;
  @override
  set dataList(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<Item> get itemList =>
      RealmObjectBase.get<Item>(this, 'itemList') as RealmList<Item>;
  @override
  set itemList(covariant RealmList<Item> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<RealmRealmListModel>> get changes =>
      RealmObjectBase.getChanges<RealmRealmListModel>(this);

  @override
  RealmRealmListModel freeze() =>
      RealmObjectBase.freezeObject<RealmRealmListModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(RealmRealmListModel._);
    return const SchemaObject(
        ObjectType.realmObject, RealmRealmListModel, 'RealmRealmListModel', [
      SchemaProperty('dataList', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('itemList', RealmPropertyType.object,
          linkTarget: 'Item', collectionType: RealmCollectionType.list),
    ]);
  }
}

class Item extends _Item with RealmEntity, RealmObjectBase, RealmObject {
  Item(
    ObjectId id,
    String name,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
  }

  Item._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<Item>> get changes =>
      RealmObjectBase.getChanges<Item>(this);

  @override
  Item freeze() => RealmObjectBase.freezeObject<Item>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Item._);
    return const SchemaObject(ObjectType.realmObject, Item, 'Item', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
    ]);
  }
}
