import 'package:flutter/material.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';
import 'package:transifox/widgets/bottonavigator.riverpod.dart';
import 'package:transifox/widgets/textfield.priverpod.dart';

class Tasa extends StatefulWidget {
  const Tasa({super.key});

  @override
  State<Tasa> createState() => _TasaState();
}

class _TasaState extends State<Tasa> {
  bool isCompuesto = false;

  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.2, 0.9],
      colors: [
        Colors.white,
        Colors.red[900]!,
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.red[900]!,
        title: Text('Tasa de interés'),
      ),
      bottomNavigationBar: CustomBottomNavigator(color: Colors.red[900]!),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(decoration: boxDecoration),
          Container(
            padding: EdgeInsets.only(bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    'Tasa de interés:',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.red[900]!,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto'),
                  ),
                  margin: EdgeInsets.only(bottom: 30),
                  height: 50,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(40)),
                ),
                if (!isCompuesto) ...[
                  Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: SizedBox(
                          width: 150,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Interés Simple',
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(6),
                                child: Image.asset('assets/interes simple.png',
                                    width: 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: SizedBox(
                          width: 150,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Capital',
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(6),
                                child: Image.asset('assets/capital.png',
                                    width: 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: SizedBox(
                      width: 150,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Tiempo',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(6),
                            child:
                                Image.asset('assets/tiempo.png', width: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: SizedBox(
                          width: 150,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Monto Compuesto',
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(6),
                                child: Image.asset('assets/montocom.png',
                                    width: 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: SizedBox(
                          width: 150,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Capital',
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(6),
                                child: Image.asset('assets/capitalcom.png',
                                    width: 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: SizedBox(
                      width: 150,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Tiempo o Periodo',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(6),
                            child:
                                Image.asset('assets/tiempocom.png', width: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownMenuItemButton(color: Colors.red[900]!),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isCompuesto = false;
                        });
                        showSnackbar(context, "Simple activado", Colors.green);
                      },
                      child: Text('Modo Simple'),
                    ),
                    SizedBox(width: 17),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[800]!,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isCompuesto = true;
                        });
                        showSnackbar(
                            context, "Compuesto activado", Colors.yellow[800]!);
                      },
                      child: Text('Modo Compuesto'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900]!,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text('Calcular'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String labelText, String assetPath) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: SizedBox(
        width: 150,
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Interés',
            prefixIcon: Padding(
              padding: EdgeInsets.all(6),
              child: Image.asset('assets/interescom.png', width: 1),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
      ),
    );
  }
}
