import 'package:package_info_plus/package_info_plus.dart';

///获取App版本等信息
class PackageInfoUtil {
  PackageInfoUtil._internal();

  static final PackageInfoUtil _instance = PackageInfoUtil._internal();

  factory PackageInfoUtil() => _instance;
  static late PackageInfo packageInfo;

  static Future<PackageInfoUtil> getInstance() async {
    packageInfo = await PackageInfo.fromPlatform();
    return _instance;
  }

  ///获取app的name
  static getAppName() {
    return packageInfo.appName;
  }

  ///获取包名
  static getPackageName() {
    return packageInfo.packageName;
  }

  ///获取版本号
  static getVersion() {
    return packageInfo.version;
  }

  ///获取buildNumber
  static getBuildNumber() {
    return packageInfo.buildNumber;
  }

  ///获取buildSignature
  static getBuildSignature() {
    return packageInfo.buildSignature;
  }

  ///获取下载商店
  static getInstallerStore() {
    return packageInfo.installerStore;
  }
}
