// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_rename_property_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class RealmRenamePropertyModel extends _RealmRenamePropertyModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmRenamePropertyModel(
    String yearsSinceBirth,
  ) {
    RealmObjectBase.set(this, 'yearsSinceBirth', yearsSinceBirth);
  }

  RealmRenamePropertyModel._();

  @override
  String get yearsSinceBirth =>
      RealmObjectBase.get<String>(this, 'yearsSinceBirth') as String;
  @override
  set yearsSinceBirth(String value) =>
      RealmObjectBase.set(this, 'yearsSinceBirth', value);

  @override
  Stream<RealmObjectChanges<RealmRenamePropertyModel>> get changes =>
      RealmObjectBase.getChanges<RealmRenamePropertyModel>(this);

  @override
  RealmRenamePropertyModel freeze() =>
      RealmObjectBase.freezeObject<RealmRenamePropertyModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(RealmRenamePropertyModel._);
    return const SchemaObject(ObjectType.realmObject, RealmRenamePropertyModel,
        'RealmRenamePropertyModel', [
      SchemaProperty('yearsSinceBirth', RealmPropertyType.string),
    ]);
  }
}
