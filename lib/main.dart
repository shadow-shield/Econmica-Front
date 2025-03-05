import 'package:flutter/material.dart';

import 'package:transifox/page/auth/login.riverpod.dart';
import 'package:transifox/page/home/home.riverpod.dart';
import 'package:transifox/page/paginabotones/botones.riverpod.dart';

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
        'botones': (BuildContext context) =>const BotonesInteres(),
      },
    );
  }
}
