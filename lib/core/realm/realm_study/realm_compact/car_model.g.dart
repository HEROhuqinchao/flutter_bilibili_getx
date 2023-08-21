// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Car extends _Car with RealmEntity, RealmObjectBase, RealmObject {
  Car(
    String name,
  ) {
    RealmObjectBase.set(this, 'name', name);
  }

  Car._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<Car>> get changes =>
      RealmObjectBase.getChanges<Car>(this);

  @override
  Car freeze() => RealmObjectBase.freezeObject<Car>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Car._);
    return const SchemaObject(ObjectType.realmObject, Car, 'Car', [
      SchemaProperty('name', RealmPropertyType.string),
    ]);
  }
}
