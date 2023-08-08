import 'dart:math';

import 'package:bilibili_getx/core/realm/realm_study/realm_realmList/realm_realm_list_model.dart';
import 'package:realm/realm.dart';

void main() {
  final schemas = [RealmRealmListModel.schema, RealmRealmListModel.schema];

  final sampleData = RealmRealmListModel(dataList: ["textOne", "textTwo"]);
}