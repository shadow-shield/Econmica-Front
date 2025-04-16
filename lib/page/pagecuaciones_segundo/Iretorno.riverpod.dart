import 'package:flutter/material.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';

import 'package:transifox/widgets/textfieldd.riverpod.dart';

class Iretorno extends StatefulWidget {
  const Iretorno({super.key});

  @override
  State<Iretorno> createState() => _IretornoState();
}

class _IretornoState extends State<Iretorno> {
  final boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.2, 0.9],
      colors: [
        Colors.white,
        Color(0xFF9C93FA),
      ],
    ),
  );

  final TextEditingController F_CajaController = TextEditingController();
  final TextEditingController P_TiempoController = TextEditingController();
  final TextEditingController N_PeriodoController = TextEditingController();
  final TextEditingController Tasa_RetornoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: const Color(0xFF9C93FA),
          title: const Text('Interes Retorno'),
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
                              labelText: 'Flujo caja',
                              icon: Image.asset('assets/rcaja.png', width: 1),
                              color: const Color(0xFF9C93FA),
                              controller: F_CajaController,
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Periodo',
                              icon: Image.asset('assets/rtiempo.png', width: 1),
                              color: const Color(0xFF9C93FA),
                              controller: P_TiempoController,
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
                              labelText: 'Numero de Periodos',
                              icon: Image.asset('assets/rperiodo.png', width: 1),
                              color: const Color(0xFF9C93FA),
                              controller: N_PeriodoController,
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Tasa de Retorno',
                              icon: Image.asset('assets/rtasa.png', width: 1),
                              color: const Color(0xFF9C93FA),
                              controller: Tasa_RetornoController,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    /* FechaSelector(
                      color: Colors.brown[200]!,
                    ), */
                    const SizedBox(height: 20),
                    const DropdownMenuItemButton(color: Color(0xFF9C93FA)),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF9C93FA),
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
