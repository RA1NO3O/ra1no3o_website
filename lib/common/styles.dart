import 'package:flutter/material.dart';

extension TextStyles on TextStyle {
  static const bold96pt = TextStyle(fontSize: 96, fontWeight: FontWeight.bold);
  static const bold32pt = TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
}

const colorSeed = Colors.blue;

final ThemeData webTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorSeed,
    platform: TargetPlatform.android);

final ThemeData webDarkTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorSeed,
    platform: TargetPlatform.android,
    brightness: Brightness.dark);
