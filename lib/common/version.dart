import 'package:package_info_plus/package_info_plus.dart';

class VersionUtil {
  static late final PackageInfo packageInfo;

  static Future<void> init() async {
    packageInfo = await PackageInfo.fromPlatform();
  }
}
