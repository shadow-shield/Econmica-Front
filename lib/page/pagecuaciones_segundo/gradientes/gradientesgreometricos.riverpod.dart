import 'package:flutter/material.dart';
import 'package:transifox/controller/gradiente.controller.service.dart';
import 'package:transifox/model/gradientes.module.dart';

import 'package:transifox/widgets/textfield.riverpod.dart';
import 'package:transifox/widgets/textfieldd.riverpod.dart';

class Gradientes_Geometricos extends StatefulWidget {
  const Gradientes_Geometricos({super.key});

  @override
  State<Gradientes_Geometricos> createState() => _Gradientes_GeometricosState();
}

class _Gradientes_GeometricosState extends State<Gradientes_Geometricos> {
  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: const [0.2, 0.9],
      colors: [
        Colors.white,
        Colors.brown[400]!,
      ],
    ),
  );

  Gradiente_Controller gestionGradiente = Gradiente_Controller();
  String? selectedCalculation;
  final TextEditingController ValorPresenteController = TextEditingController();
  final TextEditingController ValorFuturoController = TextEditingController();
  final TextEditingController PagoBaseController = TextEditingController();
  final TextEditingController TasaInteresController = TextEditingController();
  final TextEditingController NumeroPeriodosController =
      TextEditingController();
  final TextEditingController TasaCrecimientoController =
      TextEditingController();
  final TextEditingController Tipo = TextEditingController();
  final TextEditingController Resultado = TextEditingController();

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
        foregroundColor: Colors.brown[400]!,
        title: const Text('Gradientes Geometricos'),
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
                        border: Border.all(color: Colors.brown[400]!, width: 2),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.brown,
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
                                  color: Colors.brown[400]!,
                                  fontWeight: FontWeight.bold),
                            ),
                            icon: Icon(Icons.arrow_drop_down,
                                color: Colors.brown[400]!, size: 30),
                            style: TextStyle(
                                color: Colors.brown[400]!, fontSize: 16),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCalculation = newValue;
                              });
                            },
                            items: [
                              'Valor Futuro',
                              'Valor Presente',
                              'Serie',
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
                  if (selectedCalculation == 'Valor Futuro') ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: ValorFuturo(),
                    ),
                  ] else if (selectedCalculation == 'Valor Presente') ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: ValorPresente(),
                    ),
                  ] else if (selectedCalculation == 'Serie') ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Series(),
                    ),
                  ],
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                    ),
                    onPressed: () {
                      if (selectedCalculation == 'Valor Futuro') {
                        GradientesGen();
                      } else if (selectedCalculation == 'Valor Presente') {
                        GradientesGen();
                      } else if (selectedCalculation == 'Serie') {
                        GradientesGen();
                      }
                    },
                    child: const Text('Calcular',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
              Icon(Icons.trending_up, color: Colors.brown[400]),
              SizedBox(width: 8),
              Text(
                'Gradiente Geométrico',
                style: TextStyle(color: Colors.brown[400], fontSize: 16),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Los gradientes geométricos son series de pagos que cambian en un porcentaje constante (g) cada período. Modelan crecimientos exponenciales como inflación o inversiones con rendimientos porcentuales fijos.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 20),

                // Valor Presente
                Text(
                  '📌 Valor Presente (Vp):',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),

                Text(
                  'Vp = A × (i - g) / (1 - ((1 + g) / (1 + i))^n)',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                SizedBox(height: 8),
                Text(
                  'Donde:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('• A: Primer pago'),
                Text(
                    '• g: Tasa de crecimiento porcentual por período (ej. 5% → 0.05)'),
                Text('• i: Tasa de interés por período'),
                Text('• n: Número de períodos'),

                SizedBox(height: 20),

                // Valor Futuro
                Text(
                  '📌 Valor Futuro (Vf):',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),

                Text(
                  'Vf = A × [ (1 + g)^n - (1 + i)^n ] / (g - i)',
                  style: TextStyle(fontFamily: 'monospace'),
                ),

                SizedBox(height: 20),

                // Serie con Valor Presente
                Text(
                  '📌 Serie (A) dado Vp:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'A = Vp × (G-i) /(1 + g))^n * (1+i)^n',
                  style: TextStyle(fontFamily: 'monospace'),
                ),

                SizedBox(height: 20),

                // Serie con Valor Futuro
                Text(
                  '📌 Serie (A) dado Vf:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'A = Vf × (G-i) /(1 + g))^n - (1+i)^n',
                  style: TextStyle(fontFamily: 'monospace'),
                ),

                SizedBox(height: 20),
                Text(
                  '💡 Aplicaciones:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('• Pensiones con ajustes por inflación'),
                Text('• Proyectos con flujos crecientes porcentualmente'),
                Text('• Dividendos que aumentan un % fijo anual'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child:
                  Text('Cerrar', style: TextStyle(color: Colors.brown[400])),
            ),
          ],
        );
      },
    );
  }

  Widget ValorFuturo() {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                filaInput(
                    PagoBaseController, 'Pago base', 'assets/ccapital.png'),
                const SizedBox(width: 10),
                filaInput(NumeroPeriodosController, 'Numero Periodos',
                    'assets/cfinal.png'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        Row(
          children: [
            filaInput(TasaCrecimientoController, 'Tasa de crecimiento',
                'assets/ctasa.png'),
            const SizedBox(
              width: 10,
            ),
            filaInput(
                TasaInteresController, 'Tasa de interes', 'assets/montocom.png')
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            filaInput(
                ValorFuturoController, 'Valor Futuro', 'assets/interescom.png'),
            SizedBox(
              width: 10,
            ),
            tipoinput(Tipo, 'Tipo', 'assets/tipo.png'),
          ],
        ),
      ],
    );
  }

  Widget ValorPresente() {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                filaInput(
                    PagoBaseController, 'Pago base', 'assets/ccapital.png'),
                const SizedBox(width: 10),
                filaInput(NumeroPeriodosController, 'Numero Periodos',
                    'assets/cfinal.png'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        Row(
          children: [
            filaInput(TasaCrecimientoController, 'Tasa de crecimiento',
                'assets/ctasa.png'),
            const SizedBox(
              width: 10,
            ),
            filaInput(
                TasaInteresController, 'Tasa de interes', 'assets/montocom.png')
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            filaInput(
                ValorPresenteController, 'Valor Presente', 'assets/rcaja.png'),
            SizedBox(
              width: 10,
            ),
            tipoinput(Tipo, 'Tipo', 'assets/tipo.png'),
          ],
        ),
      ],
    );
  }

  Widget Series() {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                filaInput(
                    PagoBaseController, 'Pago base', 'assets/ccapital.png'),
                const SizedBox(width: 10),
                filaInput(NumeroPeriodosController, 'Numero Periodos',
                    'assets/cfinal.png'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        Row(
          children: [
            filaInput(TasaCrecimientoController, 'Tasa de crecimiento',
                'assets/ctasa.png'),
            const SizedBox(
              width: 10,
            ),
            filaInput(
                TasaInteresController, 'Tasa de interes', 'assets/montocom.png')
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            filaInput(
                ValorFuturoController, 'Valor Futuro', 'assets/monto.png'),
            SizedBox(
              width: 10,
            ),
            filaInput(
                ValorPresenteController, 'Valor Prensete', 'assets/gvalor.png'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            tipoinput(Tipo, 'Tipo', 'assets/tipo.png'),
            SizedBox(
              width: 10,
            ),
            tipoinput(Resultado, 'Resultado', 'assets/interesg.png'),
          ],
        ),
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
            color: Colors.brown[400]!,
            controller: controller,
          ),
        ),
      ],
    );
  }

  Widget tipoinput(
      TextEditingController controller, String label, String iconPath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 70,
          width: 160,
          child: TextfieldStyleTipo(
            enabled: true,
            labelText: label,
            icon: Image.asset(iconPath, width: 1),
            color: Colors.brown[400]!,
            controller: controller,
          ),
        ),
      ],
    );
  }

  GradientesGen() async {
    try {
      double? ValorPresente = double.tryParse(ValorPresenteController.text);
      double? PagoBase = double.tryParse(PagoBaseController.text);
      double? TasaInteres = double.tryParse(TasaInteresController.text);
      double? NumeroPeriodos = double.tryParse(NumeroPeriodosController.text);
      double? TasaCrecimiento = double.tryParse(TasaCrecimientoController.text);
      double? ValorFuturo = double.tryParse(ValorFuturoController.text);
      String? tipo = Tipo.text;

      GradientesModel gradiente = GradientesModel(
        NumeroPeriodos: NumeroPeriodos,
        TasaInteres: TasaInteres,
        TasaCrecimiento: TasaCrecimiento,
        ValorPresente: ValorPresente,
        PagoBase: PagoBase,
        ValorFuturo: ValorFuturo,
        Tipo: tipo,
      );

      double resultado =
          await gestionGradiente.registrarGradienteGeo(gradiente);

      Resultado.text = resultado.toStringAsFixed(2);
    } catch (e) {
      return 0.0;
    }
  }
}
