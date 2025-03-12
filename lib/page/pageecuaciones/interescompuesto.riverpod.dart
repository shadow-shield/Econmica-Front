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
<<<<<<< HEAD
      stops: const [0.2, 0.9],
=======
      stops: [0.2, 0.9],
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
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
<<<<<<< HEAD
          title: const Text('Interes Compuesto'),
=======
          title: Text('Interes Compuesto'),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
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
<<<<<<< HEAD
              padding: const EdgeInsets.only(bottom: 40),
=======
              padding: EdgeInsets.only(bottom: 40),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
<<<<<<< HEAD
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    margin: const EdgeInsets.only(bottom: 60),
                    height: 50,
                    width: 230,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(40)),
=======
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                    child: Text('Interes Compuesto  : ',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.yellow[800]!,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto')
                            ),
<<<<<<< HEAD
=======
                    margin: EdgeInsets.only(bottom: 60),
                    height: 50,
                    width: 230,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(40)),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
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
<<<<<<< HEAD
                              padding: const EdgeInsets.all(6),
=======
                              padding: EdgeInsets.all(6),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                              child: Image.asset('assets/interescom.png',
                                  width: 1)),
                          labelText: 'Interes',
                        ),
                      ),
<<<<<<< HEAD
                      const SizedBox(width: 10),
=======
                      SizedBox(width: 10),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                      SizedBox(
                        width: 180,
                        child: TextfieldStyle(
                          color: Colors.yellow[800]!,
                          icon: Container(
<<<<<<< HEAD
                              padding: const EdgeInsets.all(6),
=======
                              padding: EdgeInsets.all(6),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                              child: Image.asset('assets/capitalcom.png',
                                  width: 1)),
                          labelText: 'Capital',
                        ),
                      ),
                    ],
                  ),
<<<<<<< HEAD
                  const SizedBox(height: 10),
=======
                  SizedBox(height: 10),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180,
                        child: TextfieldStyle(
                          color: Colors.yellow[800]!,
                          icon: Container(
<<<<<<< HEAD
                              padding: const EdgeInsets.all(6),
=======
                              padding: EdgeInsets.all(6),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                              child:
                                  Image.asset('assets/montocom.png', width: 1)),
                          labelText: 'Monto Compuesto',
                        ),
                      ),
<<<<<<< HEAD
                      const SizedBox(width: 10),
=======
                      SizedBox(width: 10),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                      SizedBox(
                        width: 180,
                        child: TextfieldStyle(
                          color: Colors.yellow[800]!,
                          icon: Container(
<<<<<<< HEAD
                              padding: const EdgeInsets.all(6),
=======
                              padding: EdgeInsets.all(6),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                              child: Image.asset('assets/tiempocom.png',
                                  width: 1)),
                          labelText: 'Tiempo',
                        ),
                      ),
                    ],
                  ),
<<<<<<< HEAD
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
=======
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                    child: DropdownMenuItemButton(
                      color: Colors.yellow[800]!,
                    ),
                  ),
<<<<<<< HEAD
                  const SizedBox(height: 20),
=======
                  SizedBox(height: 20),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[800]!,
                        foregroundColor: Colors.white),
                    onPressed: () {},
<<<<<<< HEAD
                    child: const Text('Calcular'),
=======
                    child: Text('Calcular'),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
