// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_model_data_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class RealmModelDataModel extends _RealmModelDataModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmModelDataModel(
    Uuid uuid,
    ObjectId id,
    String text,
    bool state,
    int number,
    DateTime time, {
    String? textNote,
    PartModel? part,
    Iterable<String> dataList = const [],
    Set<PartModel> partSet = const {},
  }) {
    RealmObjectBase.set(this, 'uuid', uuid);
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'text', text);
    RealmObjectBase.set(this, 'state', state);
    RealmObjectBase.set(this, 'number', number);
    RealmObjectBase.set(this, 'time', time);
    RealmObjectBase.set(this, 'textNote', textNote);
    RealmObjectBase.set(this, 'part', part);
    RealmObjectBase.set<RealmList<String>>(
        this, 'dataList', RealmList<String>(dataList));
    RealmObjectBase.set<RealmSet<PartModel>>(
        this, 'partSet', RealmSet<PartModel>(partSet));
  }

  RealmModelDataModel._();

  @override
  Uuid get uuid => RealmObjectBase.get<Uuid>(this, 'uuid') as Uuid;
  @override
  set uuid(Uuid value) => RealmObjectBase.set(this, 'uuid', value);

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get text => RealmObjectBase.get<String>(this, 'text') as String;
  @override
  set text(String value) => RealmObjectBase.set(this, 'text', value);

  @override
  bool get state => RealmObjectBase.get<bool>(this, 'state') as bool;
  @override
  set state(bool value) => RealmObjectBase.set(this, 'state', value);

  @override
  int get number => RealmObjectBase.get<int>(this, 'number') as int;
  @override
  set number(int value) => RealmObjectBase.set(this, 'number', value);

  @override
  DateTime get time => RealmObjectBase.get<DateTime>(this, 'time') as DateTime;
  @override
  set time(DateTime value) => RealmObjectBase.set(this, 'time', value);

  @override
  RealmList<String> get dataList =>
      RealmObjectBase.get<String>(this, 'dataList') as RealmList<String>;
  @override
  set dataList(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmSet<PartModel> get partSet =>
      RealmObjectBase.get<PartModel>(this, 'partSet') as RealmSet<PartModel>;
  @override
  set partSet(covariant RealmSet<PartModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  String? get textNote =>
      RealmObjectBase.get<String>(this, 'textNote') as String?;
  @override
  set textNote(String? value) => RealmObjectBase.set(this, 'textNote', value);

  @override
  PartModel? get part =>
      RealmObjectBase.get<PartModel>(this, 'part') as PartModel?;
  @override
  set part(covariant PartModel? value) =>
      RealmObjectBase.set(this, 'part', value);

  @override
  Stream<RealmObjectChanges<RealmModelDataModel>> get changes =>
      RealmObjectBase.getChanges<RealmModelDataModel>(this);

  @override
  RealmModelDataModel freeze() =>
      RealmObjectBase.freezeObject<RealmModelDataModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(RealmModelDataModel._);
    return const SchemaObject(
        ObjectType.realmObject, RealmModelDataModel, 'RealmModelDataModel', [
      SchemaProperty('uuid', RealmPropertyType.uuid, primaryKey: true),
      SchemaProperty('id', RealmPropertyType.objectid),
      SchemaProperty('text', RealmPropertyType.string),
      SchemaProperty('state', RealmPropertyType.bool),
      SchemaProperty('number', RealmPropertyType.int),
      SchemaProperty('time', RealmPropertyType.timestamp),
      SchemaProperty('dataList', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('partSet', RealmPropertyType.object,
          linkTarget: 'PartModel', collectionType: RealmCollectionType.set),
      SchemaProperty('textNote', RealmPropertyType.string, optional: true),
      SchemaProperty('part', RealmPropertyType.object,
          optional: true, linkTarget: 'PartModel'),
    ]);
  }
}

class PartModel extends _PartModel
    with RealmEntity, RealmObjectBase, RealmObject {
  PartModel(
    String partId,
    String partName,
  ) {
    RealmObjectBase.set(this, 'partId', partId);
    RealmObjectBase.set(this, 'partName', partName);
  }

  PartModel._();

  @override
  String get partId => RealmObjectBase.get<String>(this, 'partId') as String;
  @override
  set partId(String value) => RealmObjectBase.set(this, 'partId', value);

  @override
  String get partName =>
      RealmObjectBase.get<String>(this, 'partName') as String;
  @override
  set partName(String value) => RealmObjectBase.set(this, 'partName', value);

  @override
  Stream<RealmObjectChanges<PartModel>> get changes =>
      RealmObjectBase.getChanges<PartModel>(this);

  @override
  PartModel freeze() => RealmObjectBase.freezeObject<PartModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(PartModel._);
    return const SchemaObject(ObjectType.realmObject, PartModel, 'PartModel', [
      SchemaProperty('partId', RealmPropertyType.string),
      SchemaProperty('partName', RealmPropertyType.string),
    ]);
  }
}
