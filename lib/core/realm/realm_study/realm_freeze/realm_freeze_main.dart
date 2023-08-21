import 'package:bilibili_getx/core/realm/realm_study/realm_freeze/realm_freeze_model.dart';
import 'package:bilibili_getx/core/realm/realm_util.dart';
import 'package:realm/realm.dart';

main() {
  ///冻结Realm
  // freezeRealm();

  ///冻结RealmResult
  // freezeRealmResults();

  ///冻结RealmObject
  // freezeRealmObject();

  ///冻结RealmObject的RealmList
  // freezeRealmListInRealmObject();

  ///检查数据是否被冻结
  // checkIfFrozen(RealmUtil().realmInstance);
}

///冻结Realm
void freezeRealm() {
  ///初始化数据
  RealmUtil().realmInstance?.write(() {
    RealmUtil().realmInstance?.add<RealmFreezeModel>(RealmFreezeModel("one"));
  });

  ///冻结Realm
  final frozenRealm = RealmUtil().realmInstance?.freeze();

  ///更新数据
  RealmUtil().realmInstance?.write(() {
    RealmUtil().realmInstance?.add<RealmFreezeModel>(RealmFreezeModel("two"));
  });

  final RealmResults<RealmFreezeModel>? results =
      frozenRealm?.all<RealmFreezeModel>();
  print("冻结Realm");
  // one
  for (var item in results!) {
    print(item.text);
  }

  ///完成冻结的工作后，必须关闭Realm，否则会内存泄漏
  frozenRealm?.close();
}

void freezeRealmResults() {
  /// 初始化数据
  RealmUtil().realmInstance?.write(() {
    RealmUtil().realmInstance?.deleteAll<RealmFreezeModel>();
    RealmUtil().realmInstance?.add<RealmFreezeModel>(RealmFreezeModel("one"));
  });

  ///冻结RealmResults
  RealmResults<RealmFreezeModel>? results =
      RealmUtil().realmInstance?.all<RealmFreezeModel>();
  final frozenRealmResults = results?.freeze();

  ///更新数据
  RealmUtil().realmInstance?.write(() {
    results?.forEach((element) {
      element.text = "1";
    });
  });

  final queryResult = frozenRealmResults?.query(r'text == $0', ["1"]);
  // 0
  print(queryResult?.length);

  ///关闭
  frozenRealmResults?.realm.close();
}

void freezeRealmObject() {
  /// 初始化数据
  RealmUtil().realmInstance?.write(() {
    RealmUtil().realmInstance?.deleteAll<RealmFreezeModel>();
    RealmUtil().realmInstance?.add<RealmFreezeModel>(RealmFreezeModel("one"));
  });

  ///冻结realmObject
  final realmObject = RealmUtil().realmInstance?.all<RealmFreezeModel>().first;
  final frozenRealmObject = realmObject?.freeze();

  ///更改数据
  RealmUtil().realmInstance?.write(() {
    RealmUtil().realmInstance?.delete<RealmFreezeModel>(realmObject!);
  });

  // false
  print(realmObject?.isValid);
  // true
  print(frozenRealmObject?.isValid);

  ///关闭
  frozenRealmObject?.realm.close();
}

///冻结RealmObject中的RealmList
void freezeRealmListInRealmObject() {
  ///初始化数据
  RealmUtil().realmInstance?.write(() {
    RealmUtil().realmInstance?.deleteAll<RealmFreezeModel>();
    RealmUtil().realmInstance?.add<RealmFreezeModel>(RealmFreezeModel(
          "One",
          attributes: ["1", "2"],
        ));
  });

  ///冻结RealmObject的RealmList
  RealmResults<RealmFreezeModel>? results =
      RealmUtil().realmInstance?.all<RealmFreezeModel>();
  final firstResult = results?.first;
  final firstResultRealmList = firstResult?.attributes.freeze();
  RealmUtil().realmInstance?.write(() {
    firstResult?.attributes.add("3");
  });
  final index = firstResultRealmList?.indexOf("3");

  /// -1
  print(index);

  ///关闭
  firstResultRealmList?.realm.close();
}

/// 检查数据是否被冻结
void checkIfFrozen(dynamic object) {
  if (object is Realm) {
    print(object.isFrozen);
  } else if (object is RealmResults) {
    print(object.isFrozen);
  } else if (object is RealmObject) {
    print(object.isFrozen);
  } else if (object is RealmList) {
    print(object.isFrozen);
  } else if (object is RealmSet) {
    print(object.isFrozen);
  } else {
    print("not type");
  }
}
