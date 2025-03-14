import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';
import 'package:transifox/widgets/bottonavigator.riverpod.dart';
import 'package:transifox/widgets/formato_fecha.riverpod.dart';
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

  String? selectedCalculation;

  final TextEditingController montoController = TextEditingController();
  final TextEditingController capitalController = TextEditingController();
  final TextEditingController tasaController = TextEditingController();
  final TextEditingController tiempoController = TextEditingController();
  final TextEditingController interesimpleController = TextEditingController();

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
              padding: EdgeInsets.only(top: 120),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: DropdownButton<String>(
                            value: selectedCalculation,
                            hint: Text('Seleccione qué calcular'),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCalculation = newValue;
                              });
                            },
                            items: [
                              'Monto',
                              'Capital',
                              'Tasa de interes',
                              'Tiempo',
                              'Interes Simple'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: TextField(
                            controller: interesimpleController,
                            enabled: selectedCalculation != 'Monto' &&
                                selectedCalculation != 'Interes Simple',
                            decoration: InputDecoration(
                              labelText: 'Interes Simple',
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(6),
                                child:
                                    Image.asset('assets/tasanu.png', width: 1),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center, // Centra los elementos
                          children: [
                            SizedBox(
                              width: 180,
                              child: TextField(
                                controller: montoController,
                                enabled:
                                    selectedCalculation != 'Interes Simple' &&
                                        selectedCalculation != 'Monto',
                                decoration: InputDecoration(
                                  labelText: 'Monto',
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Image.asset('assets/monto.png',
                                        width: 1),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            SizedBox(
                              width: 180,
                              child: TextField(
                                controller: capitalController,
                                enabled: selectedCalculation != 'Capital',
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
                          ],
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
                            controller: tasaController,
                            enabled: selectedCalculation != 'Tasa de interes',
                            decoration: InputDecoration(
                              labelText: 'Tasa de interes',
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(6),
                                child: Image.asset('assets/tasa.png', width: 1),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          width: 180,
                          child: TextField(
                            controller: tiempoController,
                            enabled: selectedCalculation != 'Tiempo',
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
                      ],
                    ),
                    SizedBox(height: 30),
                    FechaSelector(),
                    SizedBox(height: 20),
                    DropdownMenuItemButton(color: Colors.green),
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
              ),
            )
          ],
        ));
  }


CalcularTiempo(){

      var periodo='Anual';
      var formato='AÑO,MES,DIA';
      var ano=4;
      var mes=5;
      var dias=20;
      DateTime fechaEspecifica = DateTime(2025, 3, 13);
      DateTime fechaEspecifica2 = DateTime(2026, 3, 13);


        Duration diferencia = fechaEspecifica2.difference(fechaEspecifica);


      if (periodo=='Anual') {

        if (formato=='AÑO,MES,DIA'){

         // return (ano+(mes/12)+ (dias/360));
  

        }

        else{

           
        }





      }



  }
}
