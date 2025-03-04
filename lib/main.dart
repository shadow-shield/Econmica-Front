import 'package:flutter/material.dart';

import 'package:transifox/screen/auth/login.reverpod.dart';
import 'package:transifox/screen/home.riverpod.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => const Home(),
        'login': (BuildContext context) => const Login(),
      },
    );
  }
}
