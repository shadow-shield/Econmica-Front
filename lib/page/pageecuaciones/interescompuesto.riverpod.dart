import 'package:flutter/material.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';
import 'package:transifox/widgets/bottonavigator.riverpod.dart';
import 'package:transifox/widgets/textfield.priverpod.dart';

class Interes_compuesto extends StatefulWidget {
  const Interes_compuesto({super.key});

  @override
  State<Interes_compuesto> createState() => _Interes_compuestoState();
}

class _Interes_compuestoState extends State<Interes_compuesto> {
  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: const [0.2, 0.9],
      colors: [
        Colors.white,
        Colors.yellow[800]!,
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.yellow[800]!,
          title: const Text('Interes Compuesto'),
        ),
        bottomNavigationBar: CustomBottomNavigator(
          color: Colors.yellow[800]!,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: boxDecoration,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    margin: const EdgeInsets.only(bottom: 60),
                    height: 50,
                    width: 230,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(40)),
                    child: Text('Interes Compuesto  : ',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.yellow[800]!,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto')
                            ),
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Centra los elementos
                    children: [
                      SizedBox(
                        width: 180,
                        child: TextfieldStyle(
                          color: Colors.yellow[800]!,
                          icon: Container(
                              padding: const EdgeInsets.all(6),
                              child: Image.asset('assets/interescom.png',
                                  width: 1)),
                          labelText: 'Interes',
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 180,
                        child: TextfieldStyle(
                          color: Colors.yellow[800]!,
                          icon: Container(
                              padding: const EdgeInsets.all(6),
                              child: Image.asset('assets/capitalcom.png',
                                  width: 1)),
                          labelText: 'Capital',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180,
                        child: TextfieldStyle(
                          color: Colors.yellow[800]!,
                          icon: Container(
                              padding: const EdgeInsets.all(6),
                              child:
                                  Image.asset('assets/montocom.png', width: 1)),
                          labelText: 'Monto Compuesto',
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 180,
                        child: TextfieldStyle(
                          color: Colors.yellow[800]!,
                          icon: Container(
                              padding: const EdgeInsets.all(6),
                              child: Image.asset('assets/tiempocom.png',
                                  width: 1)),
                          labelText: 'Tiempo',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownMenuItemButton(
                      color: Colors.yellow[800]!,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[800]!,
                        foregroundColor: Colors.white),
                    onPressed: () {},
                    child: const Text('Calcular'),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
