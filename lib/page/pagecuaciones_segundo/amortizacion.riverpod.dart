import 'package:flutter/material.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';

import 'package:transifox/widgets/textfieldd.riverpod.dart';

class AmortizacionesState extends StatefulWidget {
  const AmortizacionesState({super.key});

  @override
  State<AmortizacionesState> createState() => _AmortizacionesStateState();
}

class _AmortizacionesStateState extends State<AmortizacionesState> {
  final boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.2, 0.9],
      colors: [
        Colors.white,
        Color(0xFFFAA89C),
      ],
    ),
  );
  final TextEditingController CPeriodicaController = TextEditingController();
  final TextEditingController CPrestadoController = TextEditingController();
  final TextEditingController TPeriodoController = TextEditingController();
  final TextEditingController NPeriodoController = TextEditingController();
  final TextEditingController CFijaController = TextEditingController();
  final TextEditingController CInteresController = TextEditingController();
  final TextEditingController CTotalController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: const Color(0xFFFAA89C),
          title: const Text('Amortizaciones'),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: boxDecoration,
            ),
            Container(
              padding: const EdgeInsets.only(top: 160),
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
                              labelText: 'Cuota Periodica',
                              icon: Image.asset('assets/acuota.png', width: 1),
                              color: const Color(0xFFFAA89C),
                              controller: CPeriodicaController,
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Capital Prestado',
                              icon: Image.asset('assets/acapital.png', width: 1),
                              color: const Color(0xFFFAA89C),
                              controller: CPrestadoController,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Tasa Periodo',
                              icon: Image.asset('assets/atasa.png', width: 1),
                              color: const Color(0xFFFAA89C),
                              controller: TPeriodoController,
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Numero Periodo',
                              icon: Image.asset('assets/anumero.png', width: 1),
                              color: const Color(0xFFFAA89C),
                              controller: NPeriodoController,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Cuota Fija',
                              icon: Image.asset('assets/afija.png', width: 1),
                              color: const Color(0xFFFAA89C),
                              controller: CFijaController,
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Cuota Interes',
                              icon: Image.asset('assets/ainteres.png', width: 1),
                              color: const Color(0xFFFAA89C),
                              controller: CInteresController,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: TextfieldStyle(
                        enabled: true,
                        labelText: 'Cuota Total',
                        icon: Image.asset('assets/atotal.png', width: 1),
                        color: const Color(0xFFFAA89C),
                        controller: CTotalController,
                      ),
                    ),
                    const SizedBox(height: 10),
                    /* FechaSelector(
                      color: Color(0xFFFAA89C),
                    ), */
                    const SizedBox(height: 20),
                    const DropdownMenuItemButton(color: Color(0xFFFAA89C)),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFAA89C),
                          foregroundColor: Colors.white),
                      onPressed: () {},
                      child: const Text('Calcular'),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
