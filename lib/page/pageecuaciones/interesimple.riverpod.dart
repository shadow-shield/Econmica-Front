import 'package:flutter/material.dart';
import 'package:transifox/controller/interes_Simple.controller.service.dart';
import 'package:transifox/model/interes_Simple.model.module.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';

import 'package:transifox/widgets/formato_fecha.riverpod.dart';
// ignore: unused_import
import 'package:transifox/widgets/formato_fecha.riverpod.dart' as miNotifiers;
import 'package:transifox/widgets/textfieldd.riverpod.dart';

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
      stops: const [0.2, 0.9],
      colors: [
        Colors.white,
        Colors.green[900]!,
      ],
    ),
  );

  String? selectedCalculation;

  IntereSimpleController gestionSimple = IntereSimpleController();
  final TextEditingController montoController = TextEditingController();
  final TextEditingController capitalController = TextEditingController();
  final TextEditingController tasaController = TextEditingController();
  final TextEditingController tiempoController = TextEditingController();
  final TextEditingController interesimpleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: mostrarInfoTema,
            ),
          ],
          foregroundColor: Colors.green,
          title: const Text('Interes Simple'),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: boxDecoration,
            ),
            Container(
              padding: const EdgeInsets.only(top: 100),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.green, width: 2),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.green,
                                  blurRadius: 5,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: SizedBox(
                              width: 165,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedCalculation,
                                  hint: const Text(
                                    'Seleccione Opcion',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  icon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.green, size: 30),
                                  style: const TextStyle(
                                      color: Colors.green, fontSize: 16),
                                  isExpanded: true,
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
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
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
                        const SizedBox(height: 15),
                        SizedBox(
                          width: 150,
                          child: TextfieldStyle(
                            enabled: true,
                            labelText: 'Interes Simple',
                            icon: Image.asset('assets/tasanu.png', width: 1),
                            color: Colors.green,
                            controller: interesimpleController,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 150,
                              child: TextfieldStyle(
                                enabled: true,
                                labelText: 'Monto',
                                icon: Image.asset('assets/monto.png', width: 1),
                                color: Colors.green,
                                controller: montoController,
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 150,
                              child: TextfieldStyle(
                                enabled: true,
                                labelText: 'Capital',
                                icon:
                                    Image.asset('assets/capital.png', width: 1),
                                color: Colors.green,
                                controller: capitalController,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          child: TextfieldStyle(
                            enabled: true,
                            labelText: 'Tasa de Interes',
                            icon: Image.asset('assets/tasa.png', width: 1),
                            color: Colors.green,
                            controller: tasaController,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 150,
                          child: TextfieldStyle(
                            enabled: true,
                            labelText: 'Tiempo',
                            icon: Image.asset('assets/tiempo.png', width: 1),
                            color: Colors.green,
                            controller: tiempoController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const FechaSelector(
                      color: Colors.green,
                    ),
                    const SizedBox(height: 20),
                    const DropdownMenuItemButton(
                      color: Colors.green,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        calcularSimple();
                      },
                      child: const Text('Calcular'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  double CalcularTiempo() {
    // 🔥 Acceder a los valores almacenados en los ValueNotifier
    String? periodo = periodoNotifier.value;
    String? formatoActual = formatoSeleccionado.value;

    print(periodo);

    // Extraer valores de la fecha ingresada
    String? anioStr = valoresFechas.value['anio'];
    String? mesStr = valoresFechas.value['mes'];
    String? diaStr = valoresFechas.value['dia'];

    String? fechaInicioStr = valoresFechas.value['fechaInicio'];
    String? fechaFinStr = valoresFechas.value['fechaFin'];

    // 🔹 Convertir valores a enteros (manejar casos nulos)
    int ano = anioStr != null ? int.tryParse(anioStr) ?? 0 : 0;
    int mes = mesStr != null ? int.tryParse(mesStr) ?? 0 : 0;
    int dias = diaStr != null ? int.tryParse(diaStr) ?? 0 : 0;

    DateTime fechaEspecifica;
    DateTime fechaEspecifica2;

    if (formatoActual == 'Año, Mes, Día') {
      // Usar los valores ingresados
      fechaEspecifica = DateTime(ano, mes, dias);
      fechaEspecifica2 =
          DateTime(ano + 1, mes, dias); // Un año después para referencia
    } else {
      // Si el usuario seleccionó 'Fecha Inicio - Fecha Fin'
      if (fechaInicioStr != null && fechaFinStr != null) {
        fechaEspecifica = DateTime.parse(fechaInicioStr);
        fechaEspecifica2 = DateTime.parse(fechaFinStr);
      } else {
        throw Exception("Las fechas de inicio y fin no pueden estar vacías.");
      }
    }

    // 🔹 Calcular la diferencia entre fechas
    Duration diferencia = fechaEspecifica2.difference(fechaEspecifica);
    double tiempo;

    if (formatoActual == 'Año, Mes, Día') {
      tiempo = ano + (mes / 12) + (dias / 360);
    } else {
      tiempo = diferencia.inDays / 365;
    }

    // 🔹 Ajustar tiempo según el período seleccionado
    switch (periodo) {
      case 'Anual':
        return tiempo;
      case 'Semestral':
        return tiempo * 2;
      case 'Trimestral':
        return tiempo * 4;
      case 'Cuatrimestral':
        return tiempo * 3; //
      case 'Bimestral':
        return tiempo * 6;
      case 'Mensual':
        return tiempo * 12;
      case 'Semanal':
        return tiempo * 52.14;
      case 'Diario':
        return tiempo * 365;
      default:
        throw Exception("Período no válido");
    }
  }

  void calcularSimple() async {
    try {
      LimpiarCampos(selectedCalculation!);

      double? capital = double.tryParse(capitalController.text.trim());
      double? interesSimple =
          double.tryParse(interesimpleController.text.trim());
      double? monto = double.tryParse(montoController.text.trim());
      double? tasaInteres = double.tryParse(tasaController.text.trim());
      double? tiempo = CalcularTiempo();

      // ignore: unnecessary_null_comparison
      if (tiempo != null) {
        tiempo =
            double.parse(tiempo.toStringAsFixed(5)); // Redondea a 2 decimales
      }

      // Se permite que los valores sean null
      InteresSimple interesSimpleObj = InteresSimple(
        Capital: capital,
        Interes_Simple: interesSimple,
        Monto: monto,
        Tasa_Interes: tasaInteres,
        Tiempo: tiempo,
      );

      Map<String, dynamic> resultado =
          await gestionSimple.registrarInteres(interesSimpleObj);

      print(resultado);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Interés Calculado con éxito')),
      );

      // Evita asignar null a los controladores
      montoController.text = resultado["Monto"]?.toString() ?? "";
      interesimpleController.text =
          resultado["Interes_Simple"]?.toString() ?? "";
      capitalController.text = resultado["Capital"]?.toString() ?? "";

      tasaController.text = resultado["Tasa_Interes"]?.toString() ?? "";
      tiempoController.text = resultado["Tiempo"]?.toString() ?? "";
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al registrar interés: $e')),
      );
    }
  }

  void LimpiarCampos(String Seleccion) {
    if (Seleccion == 'Monto') {
      tiempoController.text = '';
      montoController.text = '';
    }

    if (Seleccion == 'Capital') {
      capitalController.clear();
      montoController.text = 0.toString();
    }

    if (Seleccion == 'Tasa de interes') {
      tasaController.clear();
      montoController.text = 0.toString();
    }

    if (Seleccion == 'Tiempo') {
      tiempoController.clear();
      montoController.text = 0.toString();
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
              Icon(Icons.info, color: Colors.green),
              SizedBox(width: 8),
              Text(
                '¿Qué es el Interés Simple?',
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'El interés simple es una forma de calcular el interés generado por un capital durante un período de tiempo, sin que se acumule sobre los intereses previos.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 15),
                Text(
                  '📌 Fórmula:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Interés = Capital × Tasa × Tiempo',
                    ),
                    Text(
                      '      Monto = Capital × (1+Tasa × Tiempo)',
                    ),
                    Text(
                      ' Capital = interés / (Tasa × Tiempo)',
                    ),
                    Text(
                      ' Tasa = interés / (Capital × Tiempo)',
                    ),
                    Text(
                      ' Tiempo = interés / (Capital × Tasa)',
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  '📘 Donde:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                    '• Monto: Es el valor total acumulado al final del período de la inversión o préstamo'),
                Text('• Capital: Monto inicial invertido o prestado'),
                Text('• Tasa: Porcentaje de interés (por período)'),
                Text('• Tiempo: Duración en la que se aplica la tasa'),
                SizedBox(height: 15),
                Text(
                  '💡 El interés simple se utiliza comúnmente en préstamos a corto plazo y cálculos básicos de inversión.',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cerrar', style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }
}
