import 'package:flutter/material.dart';
import 'package:ra1no3o_website/pages/root_page.dart';

import 'common/version.dart';

void main() {
  // Be sure to add this line if `PackageInfo.fromPlatform()` is called before runApp()
  WidgetsFlutterBinding.ensureInitialized();
  VersionUtil.init();
  runApp(const RootPage());
}
