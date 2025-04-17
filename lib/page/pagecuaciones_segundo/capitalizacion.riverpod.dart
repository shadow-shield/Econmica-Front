import 'package:flutter/material.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';

import 'package:transifox/widgets/textfieldd.riverpod.dart';

class Capitalizaciones extends StatefulWidget {
  const Capitalizaciones({super.key});

  @override
  State<Capitalizaciones> createState() => _CapitalizacionesState();
}

class _CapitalizacionesState extends State<Capitalizaciones> {
  final boxDecoration = const BoxDecoration(
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
  String? selectedCalculation;
  final TextEditingController C_inicialController = TextEditingController();
  final TextEditingController C_finalController = TextEditingController();
  final TextEditingController T_interessController = TextEditingController();
  final TextEditingController TiempoController = TextEditingController();
  final TextEditingController Nperiodo_Controller = TextEditingController();
  final TextEditingController PeriodoI_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: const Color(0xFF3B3EF9),
          title: const Text('Capitalizaciones'),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Color(0xFF3B3EF9), width: 2),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFF3B3EF9),
                              blurRadius: 5,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          width: 220,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedCalculation,
                              hint: Text(
                                'Seleccione Opcion',
                                style: TextStyle(
                                    color: Color(0xFF3B3EF9),
                                    fontWeight: FontWeight.bold),
                              ),
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Color(0xFF3B3EF9), size: 30),
                              style: TextStyle(
                                  color: Color(0xFF3B3EF9), fontSize: 16),
                              isExpanded: true,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCalculation = newValue;
                                });
                              },
                              items: [
                                'Capitalizacion simple',
                                'Capitalizacion compuesta',
                                'Capitalizacion continua',
                                'Capitalizacion periodica',
                                'Capitalizacion anticipada',
                                'Capitalizacion defirida',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      value,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (selectedCalculation == 'Capitalizacion simple') ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: camposCapitalizacionSimple(),
                      )
                    ] else if (selectedCalculation ==
                        'Capitalizacion compuesta') ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: camposCapitalizacionCompuesta(),
                      )
                    ] else if (selectedCalculation ==
                        'Capitalizacion continua') ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: camposCapitalizacionContinua(),
                      )
                    ] else if (selectedCalculation ==
                        'Capitalizacion periodica') ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: camposCapitalizacionPeriodica(),
                      )
                    ] else if (selectedCalculation ==
                        'Capitalizacion anticipada') ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: campoCapitalizacionAnticipada(),
                      )
                    ] else if (selectedCalculation ==
                        'Capitalizacion defirida') ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: campoCapitalizacionDefinida(),
                      )
                    ],
                    const SizedBox(height: 10),
     
                    /* FechaSelector(
                      color: Color(0xFF3B3EF9),
                    ), */
                    const SizedBox(height: 20),
                    const DropdownMenuItemButton(color: Color(0xFF3B3EF9)),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B3EF9),
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

  Widget camposCapitalizacionSimple() {
    return Column(
      children: [
        Row(
          children: [
            filaInput(
                C_inicialController, 'Capital inicial', 'assets/ccapital.png'),
            const SizedBox(width: 10),
            filaInput(C_finalController, 'Monto final', 'assets/cfinal.png'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            filaInput(T_interessController, 'Tasa interes', 'assets/ctasa.png'),
            const SizedBox(width: 10),
            filaInput(TiempoController, 'Tiempo', 'assets/ctiempo.png'),
          ],
        ),
      ],
    );
  }

  Widget camposCapitalizacionCompuesta() {
    return Column(
      children: [
        Row(
          children: [
            filaInput(
                C_inicialController, 'Capital inicial', 'assets/ccapital.png'),
            const SizedBox(width: 10),
            filaInput(C_finalController, 'Monto final', 'assets/cfinal.png'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            filaInput(T_interessController, 'Tasa interes', 'assets/ctasa.png'),
            const SizedBox(width: 10),
            filaInput(TiempoController, 'Tiempo', 'assets/ctiempo.png'),
          ],
        ),
      ],
    );
  }

  Widget camposCapitalizacionContinua() {
    return Column(
      children: [
        Row(
          children: [
            filaInput(
                C_inicialController, 'Capital inicial', 'assets/ccapital.png'),
            const SizedBox(width: 10),
            filaInput(C_finalController, 'Monto final', 'assets/cfinal.png'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            filaInput(T_interessController, 'Tasa interes', 'assets/ctasa.png'),
            const SizedBox(width: 10),
            filaInput(TiempoController, 'Tiempo', 'assets/ctiempo.png'),
          ],
        ),
      ],
    );
  }

  Widget camposCapitalizacionPeriodica() {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                filaInput(C_inicialController, 'Capital inicial',
                    'assets/ccapital.png'),
                const SizedBox(width: 10),
                filaInput(
                    C_finalController, 'Monto final', 'assets/cfinal.png'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            filaInput(T_interessController, 'Tasa interes', 'assets/ctasa.png'),
            const SizedBox(width: 10),
            filaInput(TiempoController, 'Tiempo', 'assets/ctiempo.png'),
          ],
        ),
        const SizedBox(height: 10),
        filaInput(Nperiodo_Controller, 'NumeroPeriodo', 'assets/tiempo.png'),
      ],
    );
  }

  Widget campoCapitalizacionAnticipada() {
    return Column(
      children: [
        Row(
          children: [
            filaInput(
                C_inicialController, 'Capital inicial', 'assets/ccapital.png'),
            const SizedBox(width: 10),
            filaInput(C_finalController, 'Monto final', 'assets/cfinal.png'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            filaInput(T_interessController, 'Tasa interes', 'assets/ctasa.png'),
            const SizedBox(width: 10),
            filaInput(TiempoController, 'Tiempo', 'assets/ctiempo.png'),
          ],
        ),
      ],
    );
  }

  Widget campoCapitalizacionDefinida() {
    return Column(
      children: [
        Row(
          children: [
            filaInput(
                C_inicialController, 'Capital inicial', 'assets/ccapital.png'),
            const SizedBox(width: 10),
            filaInput(C_finalController, 'Monto final', 'assets/cfinal.png'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            filaInput(T_interessController, 'Tasa interes', 'assets/ctasa.png'),
            const SizedBox(width: 10),
            filaInput(TiempoController, 'Tiempo', 'assets/ctiempo.png'),
          ],
        ),
        const SizedBox(height: 10),
        filaInput(
            PeriodoI_Controller, 'Periodo inicial', 'assets/tiempoanu.png'),
      ],
    );
  }

  Widget filaInput(
      TextEditingController controller, String label, String iconPath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 70,
          width: 160,
          child: TextfieldStyle(
            enabled: true,
            labelText: label,
            icon: Image.asset(iconPath, width: 1),
            color: const Color(0xFF3B3EF9),
            controller: controller,
          ),
        ),
      ],
    );
  }
}
