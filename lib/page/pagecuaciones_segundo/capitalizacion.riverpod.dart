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
          actions: [
            IconButton(
              icon: const Icon(Icons.info),
              onPressed: mostrarInfoTema,
            ),
          ],
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
                                'Capitalizacion diferida',
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

  void mostrarInfoTema() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Icon(Icons.info, color: Color(0xFF3B3EF9)),
              SizedBox(width: 8),
              Text(
                'Capitalización',
                style: TextStyle(color: Color(0xFF3B3EF9), fontSize: 16),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'La capitalización se refiere al proceso mediante el cual los intereses generados por un capital se suman al mismo, generando nuevos intereses. Existen diferentes tipos:',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 20),
                Text(
                  '📌 Capitalización Simple:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'El interés no se reinvierte. Solo se calcula sobre el capital inicial.',
                ),
                SizedBox(height: 6),
                Text(
                  'Fórmula:',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'I = P × i × n\nM = P + I',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                Text('• P: Capital inicial'),
                Text('• i: Tasa de interés'),
                Text('• n: Tiempo'),
                Text('• M: Monto final'),
                SizedBox(height: 20),
                Text(
                  '📌 Capitalización Compuesta:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'Los intereses se reinvierten en cada período. El capital crece exponencialmente.',
                ),
                SizedBox(height: 6),
                Text(
                  'Fórmula:',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'M = P × (1 + i)^n',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                Text('• M: Monto acumulado'),
                Text('• P: Capital inicial'),
                Text('• i: Tasa de interés'),
                Text('• n: Número de períodos'),
                SizedBox(height: 20),
                Text(
                  '📌 Capitalización Continua:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'El interés se capitaliza infinitas veces por período.',
                ),
                SizedBox(height: 6),
                Text(
                  'Fórmula:',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'M = P × e^(i × n)',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                Text('• e: Número de Euler (≈ 2.71828)'),
                SizedBox(height: 20),
                Text(
                  '📌 Capitalización Periódica:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'La capitalización ocurre varias veces al año (mensual, trimestral, etc.).',
                ),
                SizedBox(height: 6),
                Text(
                  'Fórmula:',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'M = P × (1 + i/m)^(n × m)',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                Text('• m: Número de capitalizaciones por año'),
                SizedBox(height: 20),
                Text(
                  '📌 Capitalización Anticipada:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'El interés se cobra al inicio del período. Se aplica en operaciones como descuentos.',
                ),
                SizedBox(height: 6),
                Text(
                  'Fórmula del monto:',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'M = P / (1 - i × n)',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                SizedBox(height: 20),
                Text(
                  '📌 Capitalización Diferida:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'La capitalización comienza después de un período de gracia sin acumulación de intereses.',
                ),
                SizedBox(height: 6),
                Text(
                  'Se aplica capitalización compuesta después del tiempo de gracia:',
                ),
                Text(
                  'M = P × (1 + i)^(n - d)',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                Text('• d: Período de gracia (sin intereses)'),
                SizedBox(height: 20),
                Text(
                  '💡 Estos modelos permiten estimar con precisión el valor del dinero en el tiempo y planificar inversiones o préstamos. Elegir el método adecuado depende del tipo de operación financiera.',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cerrar', style: TextStyle(color: Color(0xFF3B3EF9))),
            ),
          ],
        );
      },
    );
  }
}
