// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Car extends _Car with RealmEntity, RealmObjectBase, RealmObject {
  Car(
    String carName,
  ) {
    RealmObjectBase.set(this, 'carName', carName);
  }

  Car._();

  @override
  String get carName => RealmObjectBase.get<String>(this, 'carName') as String;
  @override
  set carName(String value) => RealmObjectBase.set(this, 'carName', value);

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
      SchemaProperty('carName', RealmPropertyType.string),
    ]);
  }
}
