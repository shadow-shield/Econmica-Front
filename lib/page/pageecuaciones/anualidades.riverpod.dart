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
  final boxDecoration = BoxDecoration(
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
        title: Text('Anualidad'),
      ),
      bottomNavigationBar: CustomBottomNavigator(
        color: Colors.pink,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: boxDecoration,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text('Valor Futuro  : ',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.pink,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto')),
                  margin: EdgeInsets.only(bottom: 20),
                  height: 50,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(40)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text('Valor Presente  : ',
                      style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.pink,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto')),
                  margin: EdgeInsets.only(bottom: 80),
                  height: 50,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(40)),
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
                            padding: EdgeInsets.all(6),
                            child: Image.asset('assets/tasanu.png', width: 1)),
                        labelText: 'Tasa Anualidad',
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 180,
                      child: TextfieldStyle(
                        color: Colors.pink,
                        icon: Container(
                            padding: EdgeInsets.all(6),
                            child:
                                Image.asset('assets/tiempoanu.png', width: 1)),
                        labelText: 'Peridos',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      child: TextfieldStyle(
                        color: Colors.pink,
                        icon: Container(
                            padding: EdgeInsets.all(6),
                            child: Image.asset('assets/anu.png', width: 1)),
                        labelText: 'Anualidad',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
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
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white),
                  onPressed: () {},
                  child: Text('Calcular'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
