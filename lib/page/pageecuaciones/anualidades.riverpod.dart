import 'package:flutter/material.dart';
import 'package:transifox/controller/anualidad.controller.service.dart';
import 'package:transifox/model/anualidades.module.dart';
import 'package:transifox/widgets/textfieldd.riverpod.dart';

class Anualidad extends StatefulWidget {
  const Anualidad({super.key});

  @override
  State<Anualidad> createState() => _AnualidadState();
}

class _AnualidadState extends State<Anualidad> {
  final boxDecoration = const BoxDecoration(
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

  AnualidadController gestionAnulidad = AnualidadController();
  final TextEditingController tasaanualidadController = TextEditingController();
  final TextEditingController periodosanulidadController =
      TextEditingController();
  final TextEditingController montofijoController = TextEditingController();
  final TextEditingController valorFController = TextEditingController();
  final TextEditingController valorPController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.pink),
            onPressed: () {
              mostrarInfoTema();
            },
          ),
        ],
        foregroundColor: Colors.pink,
        title: const Text('Anualidad'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: boxDecoration,
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 220,
                  child: DropdownButtonFormField<String>(
                    value: selectedCalculation,
                    hint: const Text(
                      'Seleccione una opción',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                    ),
                    dropdownColor: Colors.white,
                    elevation: 5,
                    style: const TextStyle(color: Colors.pink, fontSize: 16),
                    items: ['Valor Futuro', 'Valor Presente']
                        .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: [
                                  const Icon(Icons.calculate,
                                      color: Colors.pink),
                                  const SizedBox(width: 10),
                                  Text(value),
                                ],
                              ),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCalculation = newValue;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                if (selectedCalculation == 'Valor Presente')
                  SizedBox(
                    width: 140,
                    child: TextfieldStyle(
                      enabled: true,
                      labelText: selectedCalculation!,
                      icon: Image.asset('assets/tasa-de-interes.png', width: 1),
                      color: Colors.pink,
                      controller: valorPController,
                    ),
                  )
                else if (selectedCalculation == 'Valor Futuro')
                  SizedBox(
                    width: 140,
                    child: TextfieldStyle(
                      enabled: true,
                      labelText: selectedCalculation!,
                      icon: Image.asset('assets/capital.png', width: 1),
                      color: Colors.pink,
                      controller: valorFController,
                    ),
                  )
                else
                  const SizedBox.shrink(),
                const SizedBox(height: 20),
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
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Tasa anualidad',
                              icon: Image.asset('assets/tasanu.png', width: 1),
                              color: Colors.pink,
                              controller: tasaanualidadController,
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 140,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Tiempo',
                              icon:
                                  Image.asset('assets/tiempoanu.png', width: 1),
                              color: Colors.pink,
                              controller: periodosanulidadController,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 140,
                      child: TextfieldStyle(
                        enabled: true,
                        labelText: 'Monto Fijo',
                        icon: Image.asset('assets/anu.png', width: 1),
                        color: Colors.pink,
                        controller: montofijoController,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    calcularAnualidad();
                  },
                  child: const Text('Calcular'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void calcularAnualidad() async {
    try {
      double? tasa = double.tryParse(tasaanualidadController.text.trim());
      double? periodo = double.tryParse(periodosanulidadController.text.trim());
      double? monto = double.tryParse(montofijoController.text.trim());
      double? valorF = double.tryParse(valorFController.text.trim());
      double? valorP = double.tryParse(valorPController.text.trim());

      Anualidadmodel anualidad = Anualidadmodel(
        Monto_Fijo: monto,
        Periodos_Capitalizacion: periodo,
        Tasa_Anualidad: tasa,
        Valor_Futuro: valorF,
        Valor_Presente: valorP,
      );

      Map<String, dynamic> resultado =
          await gestionAnulidad.registrarAnualidades(anualidad);

      montofijoController.text = resultado["Monto_Fijo"]?.toString() ?? "";
      periodosanulidadController.text =
          resultado["Periodos_Capitalizacion"]?.toString() ?? "";
      tasaanualidadController.text =
          resultado["Tasa_Anualidad"]?.toString() ?? "";
      valorFController.text = resultado["Valor_Futuro"]?.toString() ?? "";
      valorPController.text = resultado["Valor_Presente"]?.toString() ?? "";
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al registrar la anualidad: $e')),
      );
    }
  }

  void limpiarCampos(String Seleccion) {
    if (Seleccion == 'Valor Presente') {
      valorPController.text = '';
      valorFController.text = 0.toString();
    }

    if (Seleccion == 'Valor Futuro') {
      valorFController.text = '';
      valorPController.text = 0.toString();
    }
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
              Icon(Icons.info, color: Colors.pink),
              SizedBox(width: 8),
              Text(
                '¿Qué son las Anualidades?',
                style: TextStyle(color: Colors.pink, fontSize: 15),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Una anualidad es una serie de pagos iguales realizados a intervalos regulares durante un período de tiempo determinado.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 15),
                Text(
                  '📌 Fórmulas:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text('• Valor Futuro (VF):'),
                Text('  VF = R × [((1 + i)^n - 1) / i]'),
                SizedBox(height: 5),
                Text('• Valor Presente (VP):'),
                Text('  VA = R × [1 - (1 + i)^-n] / i'),
                SizedBox(height: 15),
                Text(
                  '📘 Donde:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('• R: Valor del pago periódico (renta o cuota)'),
                Text('• i: Tasa de interés por período'),
                Text('• n: Número total de períodos'),
                Text('• VF: Monto acumulado al final de los períodos'),
                Text('• VA: Valor equivalente en el presente de la anualidad'),
                SizedBox(height: 15),
                Text(
                  '💡 Las anualidades se usan en préstamos, inversiones y seguros. Pueden ser ordinarias (al final del período) o anticipadas (al inicio del período).',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cerrar', style: TextStyle(color: Colors.pink)),
            ),
          ],
        );
      },
    );
  }
}
