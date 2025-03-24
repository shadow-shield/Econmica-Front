import 'package:flutter/material.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';

import 'package:transifox/widgets/textfield.riverpod.dart';

class Capitalizaciones extends StatefulWidget {
  const Capitalizaciones({super.key});

  @override
  State<Capitalizaciones> createState() => _CapitalizacionesState();
}

class _CapitalizacionesState extends State<Capitalizaciones> {
  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.2, 0.9],
      colors: [
        Colors.white,
        Color(0xFF3B3EF9),
      ],
    ),
  );

  final TextEditingController C_inicialController = TextEditingController();
  final TextEditingController C_finalController = TextEditingController();
  final TextEditingController T_interessController = TextEditingController();
  final TextEditingController TiempoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Color(0xFF3B3EF9),
          title: Text('Capitalizaciones'),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: boxDecoration,
            ),
            Container(
              padding: EdgeInsets.only(top: 160),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Capital inicial',
                              icon: Image.asset('assets/ccapital.png', width: 1),
                              color: Color(0xFF3B3EF9),
                              controller: C_inicialController,
                            ),
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Capital final',
                              icon: Image.asset('assets/cfinal.png', width: 1),
                              color: Color(0xFF3B3EF9),
                              controller: C_finalController,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Tasa interes',
                              icon: Image.asset('assets/ctasa.png', width: 1),
                              color: Color(0xFF3B3EF9),
                              controller: T_interessController,
                            ),
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Tiempo',
                              icon: Image.asset('assets/ctiempo.png', width: 1),
                              color: Color(0xFF3B3EF9),
                              controller: TiempoController,
                            ),
                          ),
                        ],
                      ),
                    ),
                   SizedBox(height: 10), 
                    
                    SizedBox(height: 30),
                    /* FechaSelector(
                      color: Color(0xFF3B3EF9),
                    ), */
                    SizedBox(height: 20),
                    DropdownMenuItemButton(color: Color(0xFF3B3EF9)),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3B3EF9),
                          foregroundColor: Colors.white),
                      onPressed: () {},
                      child: Text('Calcular'),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
