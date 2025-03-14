import 'package:flutter/material.dart';

import 'package:transifox/page/auth/login.riverpod.dart';
import 'package:transifox/page/auth/register.riverpod.dart';
import 'package:transifox/page/home/home.riverpod.dart';
import 'package:transifox/page/pageecuaciones/anualidades.riverpod.dart';
import 'package:transifox/page/pageecuaciones/interescompuesto.riverpod.dart';
import 'package:transifox/page/pageecuaciones/interesimple.riverpod.dart';
import 'package:transifox/page/pageecuaciones/tasa.riverpod.dart';
import 'package:transifox/page/paginabotones/botones.riverpod.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'botones',
      routes: {
        'home': (BuildContext context) => const Home(),
        'login': (BuildContext context) => const Login(),
        'botones': (BuildContext context) => const BotonesInteres(),
        'tasa': (BuildContext context) => const Tasa(),
        'registro': (BuildContext context) => Registro_User(),
        'interesS': (BuildContext context) => const Interes_simple(),
        'interesC': (BuildContext context) => const Interes_compuesto(),
        'anualida': (BuildContext context) => const Anualidad()
      },
    );
  }
}
