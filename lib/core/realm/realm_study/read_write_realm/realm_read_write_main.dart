import 'package:bilibili_getx/core/realm/realm_study/read_write_realm/realm_read_write_model.dart';
import 'package:bilibili_getx/core/realm/realm_util.dart';
import 'package:realm/realm.dart';

main() {
  ///Realm.find(primaryKey) 按主键查询
  findObjectByPrimaryKey();

  ///Realm.all() 查找所有对象
  // findAll();

  ///RealmList.query() 筛选列表
  // queryRealmObjects();

  ///Realm.query 条件查询
  // queryRealm();

  ///全文搜索
  // queryFTS();

  ///排序结果 RQL
  // sort();

  ///限制结果的个数
  // limitResult();

  ///写数据
  // writeRealm();

  ///批量写数据
  // addObjects();

  ///更新属性
  // updateObject();

  ///Realm.add(object, update: true) 更新对应主键的属性
  // updatePrimaryKeyRealmObject();

  ///删除某一个对象
  // deleteObject();

  ///删除多个对象
  // deleteObjects();

  ///删除所有对象
  // deleteAllObjects();

  ///异步写入
  syncWrite();
}

///Realm.find(primaryKey) 根据主键查找对象
void findObjectByPrimaryKey() {
  ObjectId objectId = ObjectId();
  Person person = Person(objectId, "Jack");
  RealmUtil()
      .realmInstance
      ?.write(() => RealmUtil().realmInstance?.add<Person>(person));

  ObjectId lukePrimaryKey = objectId;
  Person? thisPerson = RealmUtil().realmInstance?.find<Person>(lukePrimaryKey);
  //Jack
  print(thisPerson?.name);
}

///Realm.all() 查询指定类型的所有数据
void findAll() {
  RealmUtil().realmInstance?.write<Person?>(() {
    RealmUtil().realmInstance?.add(Person(ObjectId(), "Jack"));
    return null;
  });
  final people = RealmUtil().realmInstance?.all<Person>();
  //Jack
  for (var item in people!) {
    print(item.name);
  }
}

///RealmList.query()
void queryRealmObjects() {
  final heroes = Team(
    ObjectId(),
    'Millennium Falcon Crew',
    crew: [
      Person(ObjectId(), 'Luke'),
      Person(ObjectId(), 'Leia'),
      Person(ObjectId(), 'Han'),
      Person(ObjectId(), 'Chewbacca'),
    ],
  );
  RealmUtil()
      .realmInstance
      ?.write(() => RealmUtil().realmInstance?.add<Team>(heroes));
  final lukeAndLeia = heroes.crew.query('name BEGINSWITH \$0', ['L']);
  // Luke
  // Leia
  for (var item in lukeAndLeia) {
    print(item.name);
  }
}

///Realm.query 条件查询
void queryRealm() {
  final team = RealmUtil()
      .realmInstance
      ?.query<Team>(r'name == $0', ['Millennium Falcon Crew']).first;
  // Millennium Falcon Crew
  print(team?.name);
  final humanCrewMembers = team?.crew.query(r'name != $0', ['Chewbacca']);
  // Luke
  // Leia
  // Han
  for (var item in humanCrewMembers!) {
    print(item.name);
  }
}

///全文搜索
void queryFTS() {
  RealmUtil().realmInstance?.write(() {
    RealmUtil().realmInstance?.add(Rug("chevron", "sheep"));
    RealmUtil().realmInstance?.add(Rug("chevron", "wool"));
  });

  final chevronRugs = RealmUtil().realmInstance?.query<Rug>(
    "pattern TEXT \$0",
    ["chevron"],
  );
  // 2
  print(chevronRugs?.length);
  final notSheepWoolRugs = RealmUtil().realmInstance?.query<Rug>(
    "material TEXT \$0",
    ["-sheep wool"],
  );
  // 1
  print(notSheepWoolRugs?.length);
}

///排序 RQL
void sort() {
  RealmUtil().realmInstance?.write(() {
    RealmUtil().realmInstance?.deleteAll<Person>();
    RealmUtil().realmInstance?.addAll<Person>([
      Person(ObjectId(), 'Luke'),
      Person(ObjectId(), 'Leia'),
      Person(ObjectId(), 'Han'),
      Person(ObjectId(), 'Chewbacca'),
    ]);
  });
  final alphabetizedPeople =
      RealmUtil().realmInstance?.query<Person>('TRUEPREDICATE SORT(name ASC)');
  // Chewbacca
  // Han
  // Leia
  // Luke
  for (var person in alphabetizedPeople!) {
    print(person.name);
  }
}

///限制查询的个数
void limitResult() {
  RealmUtil().realmInstance?.write(() {
    RealmUtil().realmInstance?.addAll([
      Person(ObjectId(), 'Luke'),
      Person(ObjectId(), 'Luke'),
      Person(ObjectId(), 'Luke'),
      Person(ObjectId(), 'Luke'),
    ]);
  });
  final limitedPeopleResults = RealmUtil()
      .realmInstance
      ?.query<Person>('name == \$0 LIMIT(2)', ['Luke']);
  // 2
  print(limitedPeopleResults?.length);
}

///写操作
///RealmObjects已经写入Realm，将无法写入另一个Realm
void writeRealm() {
  RealmUtil().realmInstance?.write<Person?>(() {
    RealmUtil().realmInstance?.deleteAll<Person>();
    return RealmUtil().realmInstance?.add<Person>(Person(ObjectId(), 'Yoda'));
  });
  RealmResults<Person>? results = RealmUtil().realmInstance?.all<Person>();
  // Yoda
  for (var item in results!) {
    print(item.name);
  }
}

///创建对象/创建多个对象
void addObjects() {
  RealmUtil().realmInstance?.write<Person?>(() {
    RealmUtil().realmInstance?.deleteAll<Person>();
    RealmUtil().realmInstance?.add<Person>(Person(ObjectId(), 'Lando'));
    RealmUtil().realmInstance?.addAll<Person>([
      Person(ObjectId(), 'Figrin D\'an'),
      Person(ObjectId(), 'Greedo'),
      Person(ObjectId(), 'Toro'),
    ]);
    return null;
  });

  RealmResults<Person>? results = RealmUtil().realmInstance?.all<Person>();
  // Lando
  // Figrin D'an
  // Greedo
  // Toro
  for (var item in results!) {
    print(item.name);
  }
}

///更新对象属性
void updateObject() {
  RealmUtil().realmInstance?.write<Team?>(() {
    RealmUtil().realmInstance?.add<Team>(Team(
          ObjectId(),
          'Spaceship Team',
          crew: [Person(ObjectId(), 'Jack')],
        ));
    return null;
  });

  ///更新对象的属性
  RealmResults<Team>? results =
      RealmUtil().realmInstance?.query<Team>(r'name == $0', ['Spaceship Team']);
  Team? spaceshipTeam = results?.first;
  RealmUtil().realmInstance?.write(() {
    spaceshipTeam?.name = 'Galactic Republic Scout Team';
    spaceshipTeam?.crew.addAll([
      Person(ObjectId(), 'Luke'),
      Person(ObjectId(), 'Leia'),
    ]);
  });
  RealmResults<Team>? modifiedResults = RealmUtil()
      .realmInstance
      ?.query<Team>(r'name == $0', ['Galactic Republic Scout Team']);
  // Galactic Republic Scout Team
  // crew:
  // Jack
  // Luke
  // Leia
  for (var item in modifiedResults!) {
    print(item.name);
    print("crew:");
    for (var it in item.crew) {
      print(it.name);
    }
  }
}

///Realm.add(_,update:true) update属性->更新拥有主键的对象
void updatePrimaryKeyRealmObject() {
  final id = ObjectId();
  final anakin = Person(id, "Anakin Skywalker");
  RealmUtil()
      .realmInstance
      ?.write(() => RealmUtil().realmInstance?.add<Person>(anakin));
  final darthVader = Person(id, 'Darth Vader');
  RealmUtil()
      .realmInstance
      ?.write(() => RealmUtil().realmInstance?.add(darthVader, update: true));
  Person? person = RealmUtil().realmInstance?.find<Person>(id);
  // Darth Vader
  print(person?.name);
}

///删除单个对象
void deleteObject() {
  RealmUtil().realmInstance?.write(() {
    RealmUtil().realmInstance?.add<Person>(Person(ObjectId(), "Jack"));
  });
  RealmResults<Person>? results1 =
      RealmUtil().realmInstance?.query<Person>(r'name == $0', ["Jack"]);
  Person jackPerson = results1!.first;
  RealmUtil()
      .realmInstance
      ?.write(() => RealmUtil().realmInstance?.delete<Person>(jackPerson));
  RealmResults<Person>? results = RealmUtil().realmInstance?.all<Person>();
  // 0
  print(results?.length);
}

///删除多个对象
void deleteObjects() {
  RealmUtil().realmInstance?.write(() {
    RealmUtil().realmInstance?.add<Person>(Person(ObjectId(), "Jack"));
    RealmUtil().realmInstance?.add<Person>(Person(ObjectId(), "Lucy"));
  });
  RealmResults<Person>? results1 =
      RealmUtil().realmInstance?.query<Person>(r'name == $0', ["Jack"]);
  RealmResults<Person>? results2 =
      RealmUtil().realmInstance?.query<Person>(r'name == $0', ["Lucy"]);
  Person jackPerson = results1!.first;
  Person lucyPerson = results2!.first;
  RealmUtil().realmInstance?.write(() =>
      RealmUtil().realmInstance?.deleteMany<Person>([jackPerson, lucyPerson]));
  RealmResults<Person>? results = RealmUtil().realmInstance?.all<Person>();
  // 0
  print(results?.length);
}

///删除所有对象
void deleteAllObjects() {
  RealmUtil().realmInstance?.write(() {
    RealmUtil().realmInstance?.add<Person>(Person(ObjectId(), "Jack"));
    RealmUtil().realmInstance?.add<Person>(Person(ObjectId(), "Lucy"));
  });
  RealmUtil()
      .realmInstance
      ?.write(() => RealmUtil().realmInstance?.deleteAll<Person>());
  RealmResults<Person>? results = RealmUtil().realmInstance?.all<Person>();
  // 0
  print(results?.length);
}

///Realm.writeAsync() 异步写操作,不阻塞主进程进行的时间
void syncWrite() {
  Person leia = Person(ObjectId(), "Leia");
  RealmUtil()
      .realmInstance
      ?.writeAsync<Person?>(() => RealmUtil().realmInstance?.add<Person>(leia));
  RealmResults<Person>? results = RealmUtil().realmInstance?.all<Person>();

  ///不会输出Leia，因为此时writeAsync还未执行完成
  for (var item in results!) {
    print(item.name);
  }
}
