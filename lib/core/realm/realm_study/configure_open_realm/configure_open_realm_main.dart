import 'dart:io';
import 'dart:math';

import 'package:bilibili_getx/core/realm/realm_study/configure_open_realm/car_model.dart';
import 'package:realm/realm.dart';
import 'package:path/path.dart' as path;

main() {
  ///打开一个运行在内存中的数据库,不记录任何写操作
  // Realm realm = openInMemoryRealm();
  // realm.write(() {
  //   realm.add<Car>(Car("benTian"));
  // });
  // RealmResults<Car> results = realm.all<Car>();
  // for (var item in results) {
  //   print(item.carName);
  // }
  // realm.close();

  ///打开本地数据库
  // Realm localRealm = openLocalRealm();
  // RealmResults<Car> results = localRealm.all<Car>();
  // for (var item in results) {
  //   print(item.carName);
  // }
  // localRealm.close();

  ///打开一个只读的数据库
  // Can't perform transactions on read-only Realms.
  // Realm realm = openReadOnlyRealm();
  // 无法执行以下写数据的代码
  // realm.write(() {
  //   realm.add<Car>(Car("BaoMa"));
  // });

  ///创建一些轻量级的FIFO特殊文件,用于协调跨线程和进程对领域的访问
  // Realm fiFoRealm = openFifoRealm();

  ///初始化数值，无需realm.write(),只能是第一次执行时会执行
  ///之前打开过，都不会再执行
  // Realm realm = initDataAddRealm();
  // RealmResults cars = realm.all<Car>();
  // print(cars.length);

  ///自定义数据库存储文件的默认存储路径和数据库文件的默认文件
  ///地址：/Users/~/FlutterProject/bilibili_getx/myRealmName.realm
  // configureDefaultRealmName();

  ///查看存储文件的位置
  ///默认存储路径地址：/Users/~/FlutterProject/bilibili_getx
  // checkDefaultStoragePath();

  ///复制数据到新的数据库
  // copyRealmToNewRealm();

  ///复制数据库并带有加密密钥
  // copyRealmToNewRealmWithKey();
}

///打开一个运行在内存中的数据库,不记录任何写操作
Realm openInMemoryRealm() {
  final config = Configuration.inMemory([Car.schema]);
  final realm = Realm(config);
  return realm;
}

///打开本地数据库
Realm openLocalRealm() {
  final config = Configuration.local([Car.schema]);
  final realm = Realm(config);
  return realm;
}

///打开一个只读的数据库
Realm openReadOnlyRealm() {
  final config = Configuration.local([Car.schema], isReadOnly: true);
  final realm = Realm(config);
  return realm;
}

///创建一些轻量级的FIFO特殊文件,用于协调跨线程和进程对领域的访问
Realm openFifoRealm() {
  final config =
      Configuration.local([Car.schema], fifoFilesFallbackPath: "./fifo_folder");
  final realm = Realm(config);
  return realm;
}

///初始化数值，无需realm.write()
Realm initDataAddRealm() {
  final config = Configuration.local([Car.schema], initialDataCallback: dataCb);
  final realm = Realm(config);
  return realm;
}

void dataCb(Realm realm) {
  realm.add(Car('Honda'));
}

///自定义数据库存储文件的默认存储路径和数据库文件的默认文件
void configureDefaultRealmName() async {
  Configuration.defaultRealmName = "myRealmName.realm";
  final customDefaultRealmPath = path.join(
    (await Directory.systemTemp.createTemp()).path,
    Configuration.defaultRealmName,
  );
  Configuration.defaultRealmName = customDefaultRealmPath;
  final config = Configuration.local([Car.schema]);
  print("地址：${config.path}");
}

///查看存储文件的位置
void checkDefaultStoragePath() {
  final storagePath = Configuration.defaultStoragePath;
  print("默认存储路径地址：${storagePath}");
}

///关闭Realm
void closeRealm(Realm realm) {
  realm.close();
}

///复制数据到新的数据库
///realm.writeCopy()注意事项
///目标文件不能已经存在
///不允许在写入事务中或迁移期间复制领域
///使用设备同步时，您必须在写入副本之前将所有本地更改与服务器同步。
///这确保了该文件可以用作新安装应用程序的起点。如果有待上传，Realm.writeCopy()会抛出
void copyRealmToNewRealm() {
  final inMemoryRealm =
      Realm(Configuration.inMemory([Car.schema], path: 'inMemory.realm'));
  inMemoryRealm.write(() {
    inMemoryRealm.addAll<Car>([
      Car("baoMa"),
      Car("benChi"),
      Car("jiLi"),
    ]);
  });
  final localConfig = Configuration.local([Car.schema]);
  inMemoryRealm.writeCopy(localConfig);
  inMemoryRealm.close();
  final localRealm = Realm(localConfig);
  final result = localRealm.all<Car>();
  print(result.length);
}

///复制数据库并带有加密密钥
void copyRealmToNewRealmWithKey() {
  final unencryptedRealm =
      Realm(Configuration.local([Car.schema], path: 'unencryptedRealm.realm'));
  unencryptedRealm.write(() => unencryptedRealm.addAll<Car>([
        Car("blueCar"),
        Car("redCar"),
        Car("greenCar"),
      ]));
  final key = List<int>.generate(64, (index) => Random().nextInt(256));
  final encryptedConfig = Configuration.local(
    [Car.schema],
    path: 'encrypted.realm',
    encryptionKey: key,
  );
  unencryptedRealm.writeCopy(encryptedConfig);
  unencryptedRealm.close();
  final encryptedRealm = Realm(encryptedConfig);
  final result = encryptedRealm.all<Car>();
  print(result.length);
}
