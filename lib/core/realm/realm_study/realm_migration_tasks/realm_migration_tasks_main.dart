import 'package:bilibili_getx/core/realm/realm_study/realm_migration_tasks/realm_migration_tasks_model.dart';
import 'package:realm/realm.dart';

main() {
  // operateOldRealm();
  operateNewRealm();
}

// void operateOldRealm() {
//   final configBeforeChanges = Configuration.local(
//     [Person.schema],
//     schemaVersion: 1,
//   );
//   final realmBeforeChanges = Realm(configBeforeChanges);
//   realmBeforeChanges.write(() {
//     realmBeforeChanges.add<Person>(Person("jack", "james", ObjectId()));
//     realmBeforeChanges.add<Person>(Person("lucky", "may", ObjectId()));
//   });
// }

void operateNewRealm() {
  final configWithChanges = Configuration.local(
    [Person.schema],
    schemaVersion: 2,
    migrationCallback: ((migration, oldSchemeVersion) {
      final oldPeople = migration.oldRealm.all('Person');
      for (final oldPerson in oldPeople) {
        final newPerson = migration.findInNewRealm<Person>(oldPerson);
        if (newPerson == null) {
          continue;
        }
        newPerson.fullName =
            "${oldPerson.dynamic.get<String>("firstName")} ${oldPerson.dynamic.get<String>("lastName")}";
        final oldId = oldPerson.dynamic.get<ObjectId>("id");
        newPerson.id = oldId.toString();
      }
    }),
  );
  final realmWithChanges = Realm(configWithChanges);
  RealmResults<Person> results = realmWithChanges.all<Person>();
  // id类型是String,数值是64dc126b8367fca9740fb0df
  // fullName是jack james
  // id类型是String,数值是64dc126b8367fca9740fb0e0
  // fullName是lucky may
  for (var item in results) {
    print("id类型是${item.id.runtimeType},数值是${item.id}");
    print("fullName是${item.fullName}");
  }
}
