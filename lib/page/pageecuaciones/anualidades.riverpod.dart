import 'package:flutter/material.dart';
import 'package:transifox/widgets/bottonavigator.riverpod.dart';


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
  String? selectedCalculation;

  final TextEditingController tasaanualidadController = TextEditingController();
  final TextEditingController periodosanulidadController =
      TextEditingController();
  final TextEditingController anualidadController = TextEditingController();

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 360,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 140,
                            child: TextField(
                              controller: tasaanualidadController,
                              decoration: InputDecoration(
                                labelText: 'Tasa Anualidad',
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(6),
                                  child: Image.asset('assets/tasanu.png',
                                      width: 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          SizedBox(
                            width: 140,
                            child: TextField(
                              controller: periodosanulidadController,
                              enabled: selectedCalculation != 'Tiempo',
                              decoration: InputDecoration(
                                labelText: 'Tiempo',
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(6),
                                  child: Image.asset('assets/tiempoanu.png',
                                      width: 1),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                      child: TextField(
                        controller: anualidadController,
                        enabled: selectedCalculation != 'Anualidades',
                        decoration: InputDecoration(
                          labelText: 'Anualidades',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(6),
                            child:
                                Image.asset('assets/anu.png', width: 1),
                          ),
                        ),
                      ),
                    ),
                  ],
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
