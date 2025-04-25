import 'package:flutter/material.dart';

import 'package:transifox/page/auth/login.riverpod.dart';
import 'package:transifox/page/auth/register.riverpod.dart';
import 'package:transifox/page/home/home.riverpod.dart';
import 'package:transifox/page/pagecuaciones_segundo/Iretorno.riverpod.dart';
import 'package:transifox/page/pagecuaciones_segundo/amortizacion.riverpod.dart';
import 'package:transifox/page/pagecuaciones_segundo/capitalizacion.riverpod.dart';
import 'package:transifox/page/pagecuaciones_segundo/gradientes/gradientes.riverpod.dart';
import 'package:transifox/page/pageecuaciones/anualidades.riverpod.dart';
import 'package:transifox/page/pageecuaciones/interescompuesto.riverpod.dart';
import 'package:transifox/page/pageecuaciones/interesimple.riverpod.dart';
import 'package:transifox/page/pageecuaciones/tasa.riverpod.dart';
import 'package:transifox/page/paginabotones/botones.riverpod.dart';
import 'package:transifox/page/paginabotones/botones2.riverpod.dart';

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
        'botones': (BuildContext context) => const BotonesInteres(),
        'tasa': (BuildContext context) => const Tasa(),
        'registro': (BuildContext context) => Registro_User(),
        'interesS': (BuildContext context) => const Interes_simple(),
        'interesC': (BuildContext context) => const InteresCompuestoPage(),
        'anualida': (BuildContext context) => const Anualidad(),
        'botones2': (BuildContext context) => const Botones_segundo(),
        'gradiente': (BuildContext context) => const Gradientes_SeriState(),
        'amortizacion': (BuildContext context) => const AmortizacionesState(),
        'capitalizacion': (BuildContext context) => const Capitalizaciones(),
        'tasaretorno': (BuildContext context) => const Iretorno()
      }, 
    );
  }
}
