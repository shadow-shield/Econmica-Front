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
      stops: [0.2, 0.9],
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
          title: Text('Interes Simple'),
        ),
        bottomNavigationBar: CustomBottomNavigator(
          color: Colors.green,
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
                    child: Text('Interes Simple  : ',
                        style: TextStyle(fontWeight: FontWeight.w300,color: Colors.green,fontStyle: FontStyle.normal,fontFamily: 'Roboto')),
                    margin: EdgeInsets.only(bottom: 60),
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
                          color: Colors.green,
                          icon: Container(
                              padding: EdgeInsets.all(6),
                              child: Image.asset('assets/monto.png', width: 1)),
                          labelText: 'Monto',
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 180,
                        child: TextfieldStyle(
                          color: Colors.green,
                          icon: Container(
                              padding: EdgeInsets.all(6),
                              child:
                                  Image.asset('assets/capital.png', width: 1)),
                          labelText: 'Capital',
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
                          color: Colors.green,
                          icon: Container(
                              padding: EdgeInsets.all(6),
                              child: Image.asset('assets/tasa.png', width: 1)),
                          labelText: 'Tasa de interes',
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 180,
                        child: TextfieldStyle(
                          color: Colors.green,
                          icon: Container(
                              padding: EdgeInsets.all(6),
                              child:
                                  Image.asset('assets/tiempo.png', width: 1)),
                          labelText: 'Tiempo',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownMenuItemButton(
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white),
                    onPressed: () {},
                    child: Text('Calcular'),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
