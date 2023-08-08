[Toc]
### Flutter 持久化存储

#### 1.1 SharedPreference

[SharedPreference插件]()

##### 1.1.1 使用

待补充

#### 1.2 Sqlite

[Sqlite插件]()

##### 1.2.1 使用

待补充

#### 1.3 Realm

[Realm插件](https://pub-web.flutter-io.cn/packages/realm)

##### 1.3.1 资料
[MonGoDB官方资料](https://www.mongodb.com/docs/realm/sdk/flutter/realm-database/read-and-write-data/)
[Flutter Realm数据类型](https://www.swvq.com/boutique/detail/60788)

##### 1.3.2 使用(测试案例)

###### 创建Flutter项目（略）

###### 添加/更新Realm到项目中 & 配置pubspec.yaml文件

```cmd
flutter pub add realm	
```
```yaml
realm: ^1.3.0
```
```cmd
flutter pub upgrade realm
```
###### 创建Model Data

```dart
import 'package:realm/realm.dart';

part 'realm_model_data_model.g.dart';

@RealmModel()
class _RealmModelDataModel {
  @PrimaryKey() //主键
  late Uuid uuid; //16Bytes的唯一值
  late ObjectId id; //mongodb特有的12Bytes唯一值
  late String text; //字符串
  late bool state; //布尔
  late int number; //整型
  late DateTime time; //时间
  late List<String> dataList; //数据列表
  late Set<_PartModel> partSet; //set集合
  String? textNote; //可选参数
  _PartModel? part; //引用其他模型
}

@RealmModel()
class _PartModel {
  late String partId;
  late String partName;
}
```
###### 生成对应的RealmObject Class
```cmd
dart run realm install
dart run realm generate
```
执行**generate**命令，目录下会出现生成一个**.g.dart**文件，注意
```dart
part 'realm_model_data_model.g.dart';
```
名称要写对，如下生成可用的**RealmModelDataModel**
```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_model_data_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class RealmModelDataModel extends _RealmModelDataModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmModelDataModel(
    Uuid uuid,
    ObjectId id,
    String text,
    bool state,
    int number,
    DateTime time, {
    String? textNote,
    PartModel? part,
    Iterable<String> dataList = const [],
    Set<PartModel> partSet = const {},
  }) {
    RealmObjectBase.set(this, 'uuid', uuid);
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'text', text);
    RealmObjectBase.set(this, 'state', state);
    RealmObjectBase.set(this, 'number', number);
    RealmObjectBase.set(this, 'time', time);
    RealmObjectBase.set(this, 'textNote', textNote);
    RealmObjectBase.set(this, 'part', part);
    RealmObjectBase.set<RealmList<String>>(
        this, 'dataList', RealmList<String>(dataList));
    RealmObjectBase.set<RealmSet<PartModel>>(
        this, 'partSet', RealmSet<PartModel>(partSet));
  }
///截取至此
```
###### 其他类型
####### RealmList
```dart
import 'package:realm/realm.dart';

part 'realm_realm_list_model.g.dart';

@RealmModel()
class _RealmRealmListModel {
  late List<String> dataList; //数据列表
  late List<_Item> itemList; //对象列表
}

@RealmModel()
class _Item {
  @PrimaryKey()
  late ObjectId id;
  late String name;
}
```
####### RealmSet
- 新增记录

- 删除记录

- 修改记录

- 查询记录