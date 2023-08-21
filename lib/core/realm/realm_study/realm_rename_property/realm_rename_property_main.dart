import 'package:bilibili_getx/core/realm/realm_study/realm_rename_property/realm_rename_property_model.dart';
import 'package:realm/realm.dart';

main() {
  final configWithRenameAge = Configuration.local(
    [RealmRenamePropertyModel.schema],
    schemaVersion: 2,
    migrationCallback: ((migration, oldSchemaVersion) {
      migration.renameProperty(
        'RealmRenamePropertyModel',
        'age',
        'yearsSinceBirth',
      );
    }),
  );
  final realmWithRenameAge = Realm(configWithRenameAge);
  realmWithRenameAge.write(() {
    realmWithRenameAge
        .add<RealmRenamePropertyModel>(RealmRenamePropertyModel("2"));
  });
  RealmResults<RealmRenamePropertyModel> results =
      realmWithRenameAge.all<RealmRenamePropertyModel>();
  for (var item in results) {
    print(item.yearsSinceBirth);
  }
}
