import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ra1no3o_website/common/route_map.dart';
import 'package:ra1no3o_website/common/styles.dart';
import 'package:ra1no3o_website/pages/home_page.dart';

import 'not_found_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});
  static const String route = '/';

  @override
  Widget build(BuildContext context) => MaterialApp(
        routes: routeMap,
        theme: webTheme,
        darkTheme: webDarkTheme,
        onUnknownRoute: (unknown) => MaterialPageRoute(
            builder: (_) => NotFoundPage(name: unknown.name ?? '')),
        home: const HomePage(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const <Locale>[
          Locale('zh', 'CN'),
          Locale('en', 'US'),
          Locale('ja', 'JP')
        ],
      );
}
