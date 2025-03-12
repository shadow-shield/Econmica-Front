import 'package:flutter/material.dart';
import 'package:transifox/widgets/bottonavigator.riverpod.dart';
import 'package:transifox/widgets/cartable.riverpod.dart';
import 'package:transifox/widgets/titulo_botones.riverpod.dart';
import 'package:transifox/widgets/containerbotoes.riverpod.dart';

class BotonesInteres extends StatefulWidget {
  const BotonesInteres({super.key});

  @override
  State<BotonesInteres> createState() => BotonesInteresState();
}

class BotonesInteresState extends State<BotonesInteres> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigator(color: Colors.blue[800]!,),
        body: Stack(
      fit: StackFit.expand,
<<<<<<< HEAD
      children: [const Background(), _texto(),],
=======
      children: [Background(), _texto(),],
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
    ));
  }
}

class _texto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
<<<<<<< HEAD
        children: [TituloTexto(),const CardTable()],
=======
        children: [TituloTexto(),CardTable()],
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
      ),
    );
  }
}
