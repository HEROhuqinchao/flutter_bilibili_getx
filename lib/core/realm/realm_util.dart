import 'package:realm/realm.dart';

// mongodb realm 跨平台数据库
class RealmUtil {
  RealmUtil._internal();

  static final RealmUtil _instance = RealmUtil._internal();
  static late LocalConfiguration? config = null;
  static late Realm? realm = null;

  factory RealmUtil(List<SchemaObject> schemaObjects) {
    config ??= Configuration.local(schemaObjects);
    realm ??= Realm(config!);
    return _instance;
  }

  ///新增
  addRealm(RealmObject realmObject) {
    realm?.write(() => realm?.add(realmObject));
  }

  ///修改
  modifyRealm(Function() doModify) {
    realm?.write(() => doModify);
  }

  ///按条件查询
  ///query写法: (r'name == $0', ['jack'])
  RealmResults<T>? queryRealm<T extends RealmObject>({
    String? query,
    List<Object>? args,
  }) {
    if (query != null && args != null) {
      return realm?.all<T>().query(query, args);
    } else {
      return realm?.all<T>();
    }
  }

  ///按主键查询某一项
  getRealmByPrimaryKey<T extends RealmObject>(String key) {
    return realm?.find<T>(key);
  }

  ///关闭Realm
  closeRealm() {
    realm?.close();
    Realm.shutdown();
  }

  ///删除
  deleteItem<T extends RealmObject>(T object) {
    realm?.write(() {
      realm?.delete<T>(object);
    });
  }
}
