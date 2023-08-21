import 'package:bilibili_getx/core/realm/realm_study/realm_compact/car_model.dart';
import 'package:realm/realm.dart';

main() {
  final config = Configuration.local([Car.schema],
      shouldCompactCallback: ((totalSize, usedSize) {
    const tenMB = 10 * 1048576;
    //如果文件超过10MB，少于50%的使用
    return (totalSize > tenMB) &&
        (usedSize.toDouble() / totalSize.toDouble()) < .5;
  }));
  final compacted = Realm.compact(config);
  print("Successfully compacted the realm: $compacted");
  final realm = Realm(config);
}
