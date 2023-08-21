import 'package:bilibili_getx/core/realm/realm_study/realm_update_object_model/modify_realm_object_model.dart';
import 'package:realm/realm.dart';

main() {
  ///原先版本
  print("原先版本");
  operateOriginalVersion(1);

  ///去掉对象类型
  print("去掉Person类型");
  operateLaterVersion(2);

  ///查询结果
  operateResultVersion(3);

  // 原先版本
  // 1
  // 去掉Person类型
  // 0
}

void operateOriginalVersion(int version) {
  final configWithPerson = Configuration.local(
    [ModifyRealmObjectModel.schema, Person.schema],
    schemaVersion: version,
  );
  final realmWithPerson = Realm(configWithPerson);
  realmWithPerson.write<Person?>(() {
    realmWithPerson.deleteAll<Person>();
    realmWithPerson.add<Person>(
      Person("jack"),
    );
    return null;
  });
  RealmResults<Person> personResults = realmWithPerson.all<Person>();
  print(personResults.length);
  realmWithPerson.close();
}

void operateLaterVersion(int version) {
  final configWithoutPerson = Configuration.local(
    [ModifyRealmObjectModel.schema],
    schemaVersion: version,
    migrationCallback: ((migration, oldSchemaVersion) {
      ///移除Person类型
      migration.deleteType('Person');
    }),
  );
  final realmWithoutPerson = Realm(configWithoutPerson);
  realmWithoutPerson.close();
}

void operateResultVersion(int version) {
  final configWithoutPerson = Configuration.local(
    [Person.schema],
    schemaVersion: version,
  );
  final realmWithoutPerson = Realm(configWithoutPerson);
  RealmResults<Person> personResults = realmWithoutPerson.all<Person>();
  print(personResults.length);
  realmWithoutPerson.close();
}
