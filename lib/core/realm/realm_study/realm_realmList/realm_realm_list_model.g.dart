// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_realm_list_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class RealmRealmListModel extends _RealmRealmListModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmRealmListModel({
    Iterable<String> dataList = const [],
  }) {
    RealmObjectBase.set<RealmList<String>>(
        this, 'dataList', RealmList<String>(dataList));
  }

  RealmRealmListModel._();

  @override
  RealmList<String> get dataList =>
      RealmObjectBase.get<String>(this, 'dataList') as RealmList<String>;
  @override
  set dataList(covariant RealmList<String> value) =>
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
    ]);
  }
}
