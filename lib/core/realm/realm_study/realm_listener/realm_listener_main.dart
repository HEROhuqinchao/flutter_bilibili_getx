import 'dart:async';

import 'package:bilibili_getx/core/realm/realm_study/realm_listener/realm_listener_model.dart';
import 'package:bilibili_getx/core/realm/realm_util.dart';
import 'package:realm/realm.dart';

main() {
  /// 监听RealmResult
  listenChangesOnRealmResults();

  /// 监听RealmObjectChanges
  listenChangesOnRealmObject();
}

// RealmResultsChanges
void listenChangesOnRealmResults() {
  final frodo = Character(ObjectId(), 'Frodo', 'Hobbit', 51);
  final samwise = Character(ObjectId(), 'Samwise', 'Hobbit', 39);
  final gollum = Character(ObjectId(), 'Gollum', 'Hobbit', 589);
  final aragorn = Character(ObjectId(), 'Aragorn', 'Human', 87);
  final legolas = Character(ObjectId(), 'Legolas', 'Elf', 2931);
  final gimli = Character(ObjectId(), 'Gimli', 'Dwarf', 140);
  final fellowshipOfTheRing = Fellowship(
    ObjectId(),
    'Fellowship of the Ring',
    members: [frodo, samwise, gollum, aragorn, legolas, gimli],
  );
  RealmUtil().realmInstance?.write(() {
    RealmUtil().realmInstance?.add<Fellowship>(fellowshipOfTheRing);
    RealmUtil().realmInstance?.add<Character>(gollum);
  });

  final characters = RealmUtil().realmInstance?.all<Character>();
  final subscription = characters?.changes.listen((event) {
    event.inserted; //此版本中添加的新集合中的索引
    event.modified; //此版本中修改的新集合中对象的索引
    event.deleted; //之前版本的集合中已从这个版本中删除的索引
    event.newModified; //考虑删除和插入后修改对象的索引
    event.moved; //移动的集合中对象的索引
    event.results; //正在监听结果收集的变化
  });
  final hobbits =
      fellowshipOfTheRing.members.query(r'species == $0', ['Hobbit']);
  final hobbitsSubscription = hobbits.changes.listen((event) {
    print(event.inserted);
    print(event.modified);
    print(event.deleted);
    print(event.newModified);
    print(event.moved);
    print(event.results);
  });
  print(hobbits.changes.isEmpty); // 判断结果是否为空
  RealmUtil().realmInstance?.write(() {
    RealmUtil().realmInstance?.delete<Character>(hobbits.first);
  });
}

// RealmObjectChanges
void listenChangesOnRealmObject() {
  final frodo = Character(ObjectId(), 'Frodo', 'Hobbit', 51);
  RealmUtil()
      .realmInstance
      ?.write(() => RealmUtil().realmInstance?.add<Character>(frodo));
  final frodoSubscription = frodo.changes.listen((event) {
    event.isDeleted; // 如果对象被删除则为true
    event.object; // 正在监控变更的Realm对象
    event.properties; // 已更改的Realm对象属性的名称
  });
}

// 监听RealmList
void listenChangesOnRealmListAndRealmSet() {
  final frodo = Character(ObjectId(), 'Frodo', 'Hobbit', 51);
  final samwise = Character(ObjectId(), 'Samwise', 'Hobbit', 39);
  final gollum = Character(ObjectId(), 'Gollum', 'Hobbit', 589);
  final aragorn = Character(ObjectId(), 'Aragorn', 'Human', 87);
  final legolas = Character(ObjectId(), 'Legolas', 'Elf', 2931);
  final gimli = Character(ObjectId(), 'Gimli', 'Dwarf', 140);
  final fellowshipOfTheRing = Fellowship(ObjectId(), 'Fellowship of the Ring',
      members: [frodo, samwise, gollum, aragorn, legolas, gimli]);
  RealmUtil().realmInstance?.write(() {
    RealmUtil().realmInstance?.add<Fellowship>(fellowshipOfTheRing);
  });
  final fellowshipSubscription =
      fellowshipOfTheRing.members.changes.listen((event) {
    event.inserted; // 此版本中添加的新列表中项目的索引
    event.modified; // 在此版本中修改的新列表中项目的索引
    event.deleted; // 列表中先前版本中已从该版本中删除的项目索引
    event.newModified; // 考虑删除和插入后修改项目的索引
    event.moved; // 列表中移动的项目的索引
    event.list; // 监听RealmList或者RealmSet
    event.isCleared; // RealmList.clear()或者RealmSet.clear()则返回true
  });
}

/// 暂停监听流
void pauseSubscription(StreamSubscription subscription) {
  subscription.pause(); //暂停监听流
}

///继续监听流
void resumeSubscription(StreamSubscription subscription) {
  subscription.resume(); //继续监听流
}

/// 取消监听流
void cancelSubscription(StreamSubscription subscription) async {
  await subscription.cancel(); // 取消订阅监听流
}
