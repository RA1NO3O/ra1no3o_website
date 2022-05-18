import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ra1no3o_website/pages/root_page.dart';

import 'firebase_options.dart';

void main() {
  runApp(const RootPage());
  _initFireBase();
}

///初始化Firebase
Future<void> _initFireBase() async => await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
