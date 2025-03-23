import 'package:flutter/material.dart';
import 'package:transifox/widgets/bottonavigator.riverpod.dart';

import 'package:transifox/widgets/cartable2.riverpod.dart';
import 'package:transifox/widgets/containerbotoes.riverpod.dart';
import 'package:transifox/widgets/titulo_botones.riverpod.dart';

class Botones_segundo extends StatefulWidget {
  const Botones_segundo({super.key});

  @override
  State<Botones_segundo> createState() => _Botones_segundoState();
}

class _Botones_segundoState extends State<Botones_segundo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavigator(
          color: Colors.blue[800]!,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Background(),
            _texto(),
          ],
        ));
  }
}

class _texto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [TituloTexto(), CardTable_Segundo()],
      ),
    );
  }
}
