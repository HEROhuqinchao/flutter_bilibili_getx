import 'dart:io';

import 'package:bilibili_getx/core/realm/realm_study/manage_realm/manage_realm_model.dart';
import 'package:bilibili_getx/core/realm/realm_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:realm/realm.dart';

main() async {
  deleteRealm();
  // bundlingRealm();
  WidgetsFlutterBinding.ensureInitialized();
  final realm = await initBundleRealm("assets/realm/default.realm");
  RealmResults<ManageRealmModel> results = realm.all<ManageRealmModel>();
  // text is Audi. id is 64e010937e233d7efa3fcf2f. model is A8
  // text is Mercedes. id is 64e010937e233d7efa3fcf30. model is G Wagon
  for (var item in results) {
    print("text is ${item.text}. id is ${item.id}. model is ${item.model}");
  }
}

///删除Realm
void deleteRealm() {
  final path = RealmUtil().realmInstance?.config.path;
  RealmUtil().realmInstance?.close();

  ///删除前先关闭realm
  Realm.deleteRealm(path!);
}

///创建出接下来要绑定的Realm文件
void bundlingRealm() {
  print("Bundling realm");
  final config =
      Configuration.local([ManageRealmModel.schema], path: "default.realm");
  final realm = Realm(config);
  realm.write(() {
    realm.add(ManageRealmModel(ObjectId(), "Audi", model: 'A8'));
    realm.add(ManageRealmModel(ObjectId(), "Mercedes", model: 'G Wagon'));
  });
  print("Bundled realm location: ${realm.config.path}");
  // realm.close();
}

Future<Realm> initBundleRealm(String assetKey) async {
  final config = Configuration.local([ManageRealmModel.schema]);
  final file = File(config.path);
  if (!await file.exists()) {
    final realmBytes = await rootBundle.load(assetKey);
    await file.writeAsBytes(
      realmBytes.buffer
          .asUint8List(realmBytes.offsetInBytes, realmBytes.lengthInBytes),
      mode: FileMode.write,
    );
  }
  return Realm(config);
}
