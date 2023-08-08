import 'package:package_info_plus/package_info_plus.dart';

///获取App版本等信息
class PackageInfoUtil {
  PackageInfoUtil._internal();

  static final PackageInfoUtil _instance = PackageInfoUtil._internal();

  factory PackageInfoUtil() => _instance;
  static late PackageInfo? packageInfo = null;

  static Future<PackageInfoUtil> getInstance() async {
    packageInfo ??= await PackageInfo.fromPlatform();
    return _instance;
  }

  ///获取app的name
  String? getAppName() {
    return packageInfo?.appName;
  }

  ///获取包名
  String? getPackageName() {
    return packageInfo?.packageName;
  }

  ///获取版本号
  String? getVersion() {
    return packageInfo?.version;
  }

  ///获取buildNumber
  String? getBuildNumber() {
    return packageInfo?.buildNumber;
  }

  ///获取buildSignature
  String? getBuildSignature() {
    return packageInfo?.buildSignature;
  }

  ///获取下载商店
  String? getInstallerStore() {
    return packageInfo?.installerStore;
  }
}
