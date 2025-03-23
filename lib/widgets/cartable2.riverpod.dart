import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:transifox/page/pagecuaciones_segundo/Iretorno.riverpod.dart';
import 'package:transifox/page/pagecuaciones_segundo/amortizacion.riverpod.dart';
import 'package:transifox/page/pagecuaciones_segundo/capitalizacion.riverpod.dart';
import 'package:transifox/page/pagecuaciones_segundo/gradientes.riverpod.dart';
import 'package:transifox/page/pageecuaciones/anualidades.riverpod.dart';
import 'package:transifox/page/pageecuaciones/interescompuesto.riverpod.dart';
import 'package:transifox/page/pageecuaciones/interesimple.riverpod.dart';
import 'package:transifox/page/pageecuaciones/tasa.riverpod.dart';

class CardTable_Segundo extends StatelessWidget {
  const CardTable_Segundo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Container(
          margin: EdgeInsets.only(top: 140), // Ajuste del margen superior
          child: Column(
            children: [
              FadeInUp(
                // 🎬 Animación de entrada
                duration: Duration(milliseconds: 600),
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        ZoomIn(
                          // 🎬 Animación de escala
                          duration: Duration(milliseconds: 800),
                          child: _cardbotones(
                            color: Color(0xFFF2FA48),
                            image: Image.asset('assets/gradiente.png'),
                            text: 'Gradientes',
                            ruta: Gradientes_SeriState(),
                          ),
                        ),
                        ZoomIn(
                          duration: Duration(milliseconds: 900),
                          child: _cardbotones(
                              color: Color(0xFFFAA89C),
                              image: Image.asset('assets/amortizacion.png'),
                              text: 'Amortización',
                              ruta: AmortizacionesState()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), // Espacio entre filas
              FadeInUp(
                // 🎬 Segunda animación de entrada
                duration: Duration(milliseconds: 700),
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        ZoomIn(
                          duration: Duration(milliseconds: 1000),
                          child: _cardbotones(
                            color: Color(0xFF3B3EF9),
                            image: Image.asset('assets/capitalizacion.png'),
                            text: 'Capitalización',
                            ruta: Capitalizaciones(),
                          ),
                        ),
                        ZoomIn(
                          duration: Duration(milliseconds: 1100),
                          child: _cardbotones(
                            color: Color(0xFF9C93FA),
                            image: Image.asset('assets/retorno.png'),
                            text: 'Interes Retorno',
                            ruta: Iretorno(),
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
        margin: EdgeInsets.all(10),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
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
              backgroundColor: this.color,
              radius: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: SizedBox(
                  width: 40, //
                  height: 40,
                  child: this.image,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              this.text,
              style: TextStyle(color: this.color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
