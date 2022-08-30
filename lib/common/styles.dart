import 'package:flutter/material.dart';

extension TextStyles on TextStyle {
  static const TextStyle bold96pt =
      TextStyle(fontSize: 96, fontWeight: FontWeight.bold);
  static const TextStyle bold32pt =
      TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
}

final ThemeData webTheme =
    ThemeData(useMaterial3: true, platform: TargetPlatform.android);

final ThemeData webDarkTheme = ThemeData(
    useMaterial3: true,
    platform: TargetPlatform.android,
    brightness: Brightness.dark);
