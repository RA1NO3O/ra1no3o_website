import 'package:flutter/material.dart';
import 'package:ra1no3o_website/common/dialect.dart';
import 'package:ra1no3o_website/common/styles.dart';

class NotFoundPage extends StatelessWidget {
  final String name;

  const NotFoundPage({super.key, required this.name});
  static const String route = '/404';

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(':(', style: TextStyles.bold96pt.withColor(Colors.white)),
              Text('404:Page Not Found',
                  style: TextStyles.bold32pt.withColor(Colors.white)),
              Text('页面未找到', style: TextStyles.bold32pt.withColor(Colors.white)),
              Text('ページ見つけありません',
                  style: TextStyles.bold32pt.withColor(Colors.white)),
            ],
          ),
        )),
      );
}
