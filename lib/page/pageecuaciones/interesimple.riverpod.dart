import 'package:flutter/material.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';
import 'package:transifox/widgets/bottonavigator.riverpod.dart';
import 'package:transifox/widgets/textfield.priverpod.dart';

class Interes_simple extends StatefulWidget {
  const Interes_simple({super.key});

  @override
  State<Interes_simple> createState() => _Interes_simpleState();
}

class _Interes_simpleState extends State<Interes_simple> {
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
        Colors.green[900]!,
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.green,
<<<<<<< HEAD
          title: const Text('Interes Simple'),
        ),
        bottomNavigationBar: const CustomBottomNavigator(
=======
          title: Text('Interes Simple'),
        ),
        bottomNavigationBar: CustomBottomNavigator(
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
          color: Colors.green,
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
=======
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text('Interes Simple  : ',
                        style: TextStyle(fontWeight: FontWeight.w300,color: Colors.green,fontStyle: FontStyle.normal,fontFamily: 'Roboto')),
                    margin: EdgeInsets.only(bottom: 60),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                    height: 50,
                    width: 230,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(40)),
<<<<<<< HEAD
                    child: Text('Interes Simple  : ',
                        style: TextStyle(fontWeight: FontWeight.w300,color: Colors.green,fontStyle: FontStyle.normal,fontFamily: 'Roboto')),
=======
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Centra los elementos
                    children: [
                      SizedBox(
                        width: 180,
                        child: TextfieldStyle(
                          color: Colors.green,
                          icon: Container(
<<<<<<< HEAD
                              padding: const EdgeInsets.all(6),
=======
                              padding: EdgeInsets.all(6),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                              child: Image.asset('assets/monto.png', width: 1)),
                          labelText: 'Monto',
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
                          color: Colors.green,
                          icon: Container(
<<<<<<< HEAD
                              padding: const EdgeInsets.all(6),
=======
                              padding: EdgeInsets.all(6),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                              child:
                                  Image.asset('assets/capital.png', width: 1)),
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
                          color: Colors.green,
                          icon: Container(
<<<<<<< HEAD
                              padding: const EdgeInsets.all(6),
=======
                              padding: EdgeInsets.all(6),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                              child: Image.asset('assets/tasa.png', width: 1)),
                          labelText: 'Tasa de interes',
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
                          color: Colors.green,
                          icon: Container(
<<<<<<< HEAD
                              padding: const EdgeInsets.all(6),
=======
                              padding: EdgeInsets.all(6),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                              child:
                                  Image.asset('assets/tiempo.png', width: 1)),
                          labelText: 'Tiempo',
                        ),
                      ),
                    ],
                  ),
<<<<<<< HEAD
                  const SizedBox(height: 20),
                  const Padding(
=======
                  SizedBox(height: 20),
                  Padding(
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownMenuItemButton(
                      color: Colors.green,
                    ),
                  ),
<<<<<<< HEAD
                  const SizedBox(height: 20),
=======
                  SizedBox(height: 20),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
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
