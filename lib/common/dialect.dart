import 'dart:io';

import 'package:flutter/material.dart';

///MaterialStateProperty<Color> 客制化简写(方言)，支持Color和int类型参数
MaterialStateProperty<Color> mColor(dynamic color) {
  switch (color.runtimeType) {
    case Colors:
    case Color:
      return MaterialStateProperty.all(color);
    case int:
      return MaterialStateProperty.all(Color(color));
  }
  throw ("Color Parameter type not supported");
}

///获取设备安全区(方言)
EdgeInsets devicePadding(context) => MediaQuery.of(context).padding;

///获取设备尺寸(方言)
Size deviceSize(context) => MediaQuery.of(context).size;

///获取文本主题(方言)
TextTheme getTextTheme(context) => Theme.of(context).textTheme;

///获取DPI(方言)
int getDPI(BuildContext context) =>
    MediaQuery.of(context).devicePixelRatio.round().toInt();

///MaterialPageRoute客制化简写(方言)
PageRoute mpr(Widget page) => MaterialPageRoute(builder: (bc) => page);

///显示提示消息(方言)
ScaffoldFeatureController showSnackBar(BuildContext bc, SnackBar snackBar) {
  //弹出前先清除先前的，避免用户操作卡顿误认知
  ScaffoldMessenger.of(bc).clearSnackBars();
  return ScaffoldMessenger.of(bc).showSnackBar(snackBar);
}

///是否处于深色模式
bool isDarkMode(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

///访问资源文件快捷方式
extension Assets on File {
  ///图标路径
  static const String iconPath = 'assets/icons';

  ///图像路径
  static const String imagePath = 'assets/images';

  ///快速访问图标文件夹下的图像
  static AssetImage icon(String fileName) => AssetImage('$iconPath/$fileName');

  ///快速访问images文件夹下的图像
  static AssetImage image(String fileName) =>
      AssetImage('$imagePath/$fileName');
}

///字体样式扩展类
extension TextStyleExt on TextStyle {
  ///快速追加颜色属性(支持int和Color类型)
  TextStyle withColor(dynamic c) {
    switch (c.runtimeType) {
      case Color:
        return copyWith(color: c);
      case int:
        return copyWith(color: Color(c));
      default:
        throw ("Color Parameter type not supported");
    }
  }

  ///快速追加黑色字体颜色属性
  TextStyle withBlack() => copyWith(color: Colors.black);

  ///快速追加白色字体颜色属性
  TextStyle withWhite() => copyWith(color: Colors.white);

  ///快速追加主题色字体颜色属性
  TextStyle withPrimaryColor(BuildContext bc) =>
      copyWith(color: Theme.of(bc).primaryColor);

  TextStyle withPuHui() => copyWith(fontFamily: 'Alibaba-PuHui');
}
