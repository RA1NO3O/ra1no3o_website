import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() {
  runApp(const WebApp());
}

class WebApp extends StatefulWidget {
  const WebApp({Key? key}) : super(key: key);

  @override
  State<WebApp> createState() => _WebAppState();
}

class _WebAppState extends State<WebApp> {
  @override
  void initState() {
    _initFireBase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RA1NO3O - 首页',
      theme: ThemeData(useMaterial3: true),
      home: const NewPage(),
    );
  }

  Future<void> _initFireBase() async => await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: Drawer(
            child: ListView(
          children: const [DrawerHeader(child: Text('导航'))],
        )),
        appBar: AppBar(
          title: const Text('RA1NO3O.dev'),
          centerTitle: false,
        ),
        body: ListView(),
      );
}
