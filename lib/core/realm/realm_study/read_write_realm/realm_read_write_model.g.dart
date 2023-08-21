// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_read_write_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Person extends _Person with RealmEntity, RealmObjectBase, RealmObject {
  Person(
    ObjectId id,
    String name,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
  }

  Person._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

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
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
    ]);
  }
}

class Team extends _Team with RealmEntity, RealmObjectBase, RealmObject {
  Team(
    ObjectId id,
    String name, {
    Iterable<Person> crew = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set<RealmList<Person>>(
        this, 'crew', RealmList<Person>(crew));
  }

  Team._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  RealmList<Person> get crew =>
      RealmObjectBase.get<Person>(this, 'crew') as RealmList<Person>;
  @override
  set crew(covariant RealmList<Person> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Team>> get changes =>
      RealmObjectBase.getChanges<Team>(this);

  @override
  Team freeze() => RealmObjectBase.freezeObject<Team>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Team._);
    return const SchemaObject(ObjectType.realmObject, Team, 'Team', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('crew', RealmPropertyType.object,
          linkTarget: 'Person', collectionType: RealmCollectionType.list),
    ]);
  }
}

class Rug extends _Rug with RealmEntity, RealmObjectBase, RealmObject {
  Rug(
    String pattern,
    String material,
  ) {
    RealmObjectBase.set(this, 'pattern', pattern);
    RealmObjectBase.set(this, 'material', material);
  }

  Rug._();

  @override
  String get pattern => RealmObjectBase.get<String>(this, 'pattern') as String;
  @override
  set pattern(String value) => RealmObjectBase.set(this, 'pattern', value);

  @override
  String get material =>
      RealmObjectBase.get<String>(this, 'material') as String;
  @override
  set material(String value) => RealmObjectBase.set(this, 'material', value);

  @override
  Stream<RealmObjectChanges<Rug>> get changes =>
      RealmObjectBase.getChanges<Rug>(this);

  @override
  Rug freeze() => RealmObjectBase.freezeObject<Rug>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Rug._);
    return const SchemaObject(ObjectType.realmObject, Rug, 'Rug', [
      SchemaProperty('pattern', RealmPropertyType.string,
          indexType: RealmIndexType.fullText),
      SchemaProperty('material', RealmPropertyType.string,
          indexType: RealmIndexType.fullText),
    ]);
  }
}
