import 'package:flutter/material.dart';
import 'package:transifox/widgets/DropdowButtonAnualidad.riverpod.dart';
import 'package:transifox/widgets/bottonavigator.riverpod.dart';
import 'package:transifox/widgets/textfield.priverpod.dart';

class Anualidad extends StatefulWidget {
  const Anualidad({super.key});

  @override
  State<Anualidad> createState() => _AnualidadState();
}

class _AnualidadState extends State<Anualidad> {
<<<<<<< HEAD
  static const boxDecoration = BoxDecoration(
=======
  final boxDecoration = BoxDecoration(
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.2, 0.9],
      colors: [
        Colors.white,
        Colors.pink,
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.pink,
<<<<<<< HEAD
        title: const Text('Anualidad'),
      ),
      bottomNavigationBar: const CustomBottomNavigator(
=======
        title: Text('Anualidad'),
      ),
      bottomNavigationBar: CustomBottomNavigator(
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
        color: Colors.pink,
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
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 50,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(40)),
=======
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                  child: Text('Valor Futuro  : ',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.pink,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto')),
<<<<<<< HEAD
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  margin: const EdgeInsets.only(bottom: 80),
=======
                  margin: EdgeInsets.only(bottom: 20),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                  height: 50,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(40)),
<<<<<<< HEAD
=======
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                  child: Text('Valor Presente  : ',
                      style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.pink,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto')),
<<<<<<< HEAD
=======
                  margin: EdgeInsets.only(bottom: 80),
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
                        color: Colors.pink,
                        icon: Container(
<<<<<<< HEAD
                            padding: const EdgeInsets.all(6),
=======
                            padding: EdgeInsets.all(6),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                            child: Image.asset('assets/tasanu.png', width: 1)),
                        labelText: 'Tasa Anualidad',
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
                        color: Colors.pink,
                        icon: Container(
<<<<<<< HEAD
                            padding: const EdgeInsets.all(6),
=======
                            padding: EdgeInsets.all(6),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                            child:
                                Image.asset('assets/tiempoanu.png', width: 1)),
                        labelText: 'Peridos',
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
                        color: Colors.pink,
                        icon: Container(
<<<<<<< HEAD
                            padding: const EdgeInsets.all(6),
=======
                            padding: EdgeInsets.all(6),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                            child: Image.asset('assets/anu.png', width: 1)),
                        labelText: 'Anualidad',
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Frecuentacia Capitalizacion',
                              style: TextStyle(fontWeight: FontWeight.w300)),
                          SizedBox(height: 10),
                          DropMenuAnualidad(color: Colors.pink),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Frecuenca de Pago',
                              style: TextStyle(fontWeight: FontWeight.w300)),
                          SizedBox(height: 10),
                          DropMenuAnualidad(color: Colors.pink),
                        ],
                      ),
                    ],
                  ),
                ),
<<<<<<< HEAD
                const SizedBox(height: 20),
=======
                SizedBox(height: 20),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
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
      ),
    );
  }
}
