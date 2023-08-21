import 'package:realm/realm.dart';

import 'car_model.dart';

main() {
  // Realm.deleteRealm("encryptedRealm.realm");
  final key = List<int>.generate(64, (i) => 1);
  final encryptedConfig = Configuration.local([Car.schema],
      encryptionKey: key, path: "encryptedRealm.realm");
  final encryptedRealm = Realm(encryptedConfig);
  print(key);
  print(encryptedRealm.config.path);
}
