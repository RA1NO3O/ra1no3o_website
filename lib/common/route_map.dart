import 'package:flutter/widgets.dart';
import 'package:ra1no3o_website/pages/home_page.dart';
import 'package:ra1no3o_website/pages/not_found_page.dart';

///路由
Map<String, WidgetBuilder> routeMap = {
  HomePage.route: (bc) => HomePage(),
  NotFoundPage.route: (bc) => const NotFoundPage(name: ''),
};
