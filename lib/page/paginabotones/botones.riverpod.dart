import 'package:flutter/material.dart';
import 'package:transifox/page/Prestamos/Prestamos.riverpod.dart';
import 'package:transifox/page/auth/login.riverpod.dart';
import 'package:transifox/page/pagecuaciones_segundo/gradientes/gradientesaritmetico.riverpod.dart';
import 'package:transifox/widgets/botonback.riverpod.dart';
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
        bottomNavigationBar: CustomBottomNavigator(
          color: Colors.blue[800]!,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            const Background(),
            _texto(),
            Container(
              padding: EdgeInsets.only(left: 20, bottom: 400),
              alignment: Alignment.centerLeft,
              child: Boton_Back(
                ruta: Login(),
              ),
            ),
          ],
        ));
  }
}

class _texto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TituloTexto(),
          const CardTable(),
          SizedBox(height: 20,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CalculadoraPrestamos()),
              );
            },
            child:  Text('Sistema de  Prestamos',
                style: TextStyle(color: Colors.blue[800]!)),
          ),
        ],
      ),
    );
  }
}
