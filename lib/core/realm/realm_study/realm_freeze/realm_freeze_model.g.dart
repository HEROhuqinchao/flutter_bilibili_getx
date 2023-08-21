// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_freeze_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class RealmFreezeModel extends _RealmFreezeModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmFreezeModel(
    String text, {
    Iterable<String> attributes = const [],
  }) {
    RealmObjectBase.set(this, 'text', text);
    RealmObjectBase.set<RealmList<String>>(
        this, 'attributes', RealmList<String>(attributes));
  }

  RealmFreezeModel._();

  @override
  String get text => RealmObjectBase.get<String>(this, 'text') as String;
  @override
  set text(String value) => RealmObjectBase.set(this, 'text', value);

  @override
  RealmList<String> get attributes =>
      RealmObjectBase.get<String>(this, 'attributes') as RealmList<String>;
  @override
  set attributes(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<RealmFreezeModel>> get changes =>
      RealmObjectBase.getChanges<RealmFreezeModel>(this);

  @override
  RealmFreezeModel freeze() =>
      RealmObjectBase.freezeObject<RealmFreezeModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(RealmFreezeModel._);
    return const SchemaObject(
        ObjectType.realmObject, RealmFreezeModel, 'RealmFreezeModel', [
      SchemaProperty('text', RealmPropertyType.string),
      SchemaProperty('attributes', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
    ]);
  }
}
