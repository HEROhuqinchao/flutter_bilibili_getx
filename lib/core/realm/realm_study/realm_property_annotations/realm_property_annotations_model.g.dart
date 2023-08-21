// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_property_annotations_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class RealmPropertyAnnotationsModel extends _RealmPropertyAnnotationsModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  RealmPropertyAnnotationsModel(
    ObjectId id,
    String quickQueryProperty,
    String fullTextSearch,
    int numberOfKeys, {
    String? optionalProperty,
    double defaultValue = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet =
          RealmObjectBase.setDefaults<RealmPropertyAnnotationsModel>({
        'defaultValue': 0,
      });
    }
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'optionalProperty', optionalProperty);
    RealmObjectBase.set(this, 'defaultValue', defaultValue);
    RealmObjectBase.set(this, 'quickQueryProperty', quickQueryProperty);
    RealmObjectBase.set(this, 'fullTextSearch', fullTextSearch);
    RealmObjectBase.set(this, 'keys', numberOfKeys);
  }

  RealmPropertyAnnotationsModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get optionalProperty =>
      RealmObjectBase.get<String>(this, 'optionalProperty') as String?;
  @override
  set optionalProperty(String? value) =>
      RealmObjectBase.set(this, 'optionalProperty', value);

  @override
  double get defaultValue =>
      RealmObjectBase.get<double>(this, 'defaultValue') as double;
  @override
  set defaultValue(double value) =>
      RealmObjectBase.set(this, 'defaultValue', value);

  @override
  String get quickQueryProperty =>
      RealmObjectBase.get<String>(this, 'quickQueryProperty') as String;
  @override
  set quickQueryProperty(String value) =>
      RealmObjectBase.set(this, 'quickQueryProperty', value);

  @override
  String get fullTextSearch =>
      RealmObjectBase.get<String>(this, 'fullTextSearch') as String;
  @override
  set fullTextSearch(String value) =>
      RealmObjectBase.set(this, 'fullTextSearch', value);

  @override
  int get numberOfKeys => RealmObjectBase.get<int>(this, 'keys') as int;
  @override
  set numberOfKeys(int value) => RealmObjectBase.set(this, 'keys', value);

  @override
  Stream<RealmObjectChanges<RealmPropertyAnnotationsModel>> get changes =>
      RealmObjectBase.getChanges<RealmPropertyAnnotationsModel>(this);

  @override
  RealmPropertyAnnotationsModel freeze() =>
      RealmObjectBase.freezeObject<RealmPropertyAnnotationsModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(RealmPropertyAnnotationsModel._);
    return const SchemaObject(ObjectType.realmObject,
        RealmPropertyAnnotationsModel, 'RealmPropertyAnnotationsModel', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('optionalProperty', RealmPropertyType.string,
          optional: true),
      SchemaProperty('defaultValue', RealmPropertyType.double),
      SchemaProperty('quickQueryProperty', RealmPropertyType.string,
          indexType: RealmIndexType.regular),
      SchemaProperty('fullTextSearch', RealmPropertyType.string,
          indexType: RealmIndexType.fullText),
      SchemaProperty('numberOfKeys', RealmPropertyType.int, mapTo: 'keys'),
    ]);
  }
}
