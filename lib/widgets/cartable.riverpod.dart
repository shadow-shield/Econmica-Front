import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:transifox/page/pageecuaciones/anualidades.riverpod.dart';
import 'package:transifox/page/pageecuaciones/interescompuesto.riverpod.dart';
import 'package:transifox/page/pageecuaciones/interesimple.riverpod.dart';
import 'package:transifox/page/pageecuaciones/tasa.riverpod.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Container(
<<<<<<< HEAD
          margin: const EdgeInsets.only(top: 140), // Ajuste del margen superior
=======
          margin: EdgeInsets.only(top: 140), // Ajuste del margen superior
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
          child: Column(
            children: [
              FadeInUp(
                // 🎬 Animación de entrada
<<<<<<< HEAD
                duration: const Duration(milliseconds: 600),
=======
                duration: Duration(milliseconds: 600),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        ZoomIn(
                          
                          // 🎬 Animación de escala
<<<<<<< HEAD
                          duration: const Duration(milliseconds: 800),
=======
                          duration: Duration(milliseconds: 800),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                          child: _cardbotones(
                            color: Colors.red[900]!,
                            image: Image.asset('assets/tasa-de-interes.png'),
                            text: 'Tasa',
<<<<<<< HEAD
                            ruta: const Tasa(),
                          ),
                        ),
                        ZoomIn(
                          duration: const Duration(milliseconds: 900),
=======
                            ruta: Tasa(),
                          ),
                        ),
                        ZoomIn(
                          duration: Duration(milliseconds: 900),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                          child: _cardbotones(
                            color: Colors.green,
                            image: Image.asset('assets/interes simple.png'),
                            text: 'Interés Simple',
<<<<<<< HEAD
                            ruta: const Interes_simple()
=======
                            ruta: Interes_simple()
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
<<<<<<< HEAD
              const SizedBox(height: 20), // Espacio entre filas
              FadeInUp(
                // 🎬 Segunda animación de entrada
                duration: const Duration(milliseconds: 700),
=======
              SizedBox(height: 20), // Espacio entre filas
              FadeInUp(
                // 🎬 Segunda animación de entrada
                duration: Duration(milliseconds: 700),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        ZoomIn(
<<<<<<< HEAD
                          duration: const Duration(milliseconds: 1000),
=======
                          duration: Duration(milliseconds: 1000),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                          child: _cardbotones(
                            color: Colors.yellow[800]!,
                            image: Image.asset('assets/incompuesto.png'),
                            text: 'Interés Compuesto',
<<<<<<< HEAD
                            ruta: const Interes_compuesto(),
                          ),
                        ),
                        ZoomIn(
                          duration: const Duration(milliseconds: 1100),
=======
                            ruta: Interes_compuesto(),
                          ),
                        ),
                        ZoomIn(
                          duration: Duration(milliseconds: 1100),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                          child: _cardbotones(

                            color: Colors.pink,
                            image: Image.asset('assets/anualidades.png'),
                            text: 'Anualidades',
<<<<<<< HEAD
                            ruta: const Anualidad(),
=======
                            ruta: Anualidad(),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _cardbotones extends StatelessWidget {
  final Widget image; 
  final String text;
  final Color color;
  final Widget ruta;
  //variabel de ruta


  const _cardbotones({
    required this.image,
    required this.text,
    required this.color,
    required this.ruta,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ruta),
        );
      },
      child: Container(
<<<<<<< HEAD
        margin: const EdgeInsets.all(10),
=======
        margin: EdgeInsets.all(10),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
        height: 150,
        decoration: BoxDecoration(
      
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
<<<<<<< HEAD
          boxShadow: const [
=======
          boxShadow: [
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
<<<<<<< HEAD
              backgroundColor: color,
=======
              backgroundColor: this.color,
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
              radius: 40, 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    50), 
                child: SizedBox(
                  width:
                      40, //
                  height:
                      40,
<<<<<<< HEAD
                  child: image,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
=======
                  child: this.image,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              this.text,
              style: TextStyle(color: this.color, fontWeight: FontWeight.bold),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
            ),
          ],
        ),
      ),
    );
  }
}
