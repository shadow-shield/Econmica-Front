import 'package:flutter/material.dart';
import 'package:transifox/controller/interes_Compuesto.controller.service.dart';
import 'package:transifox/controller/interes_Simple.controller.service.dart';
import 'package:transifox/model/interes_Compuesto.module.dart';
import 'package:transifox/model/interes_Simple.model.module.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';

import 'package:transifox/widgets/formato_fecha.riverpod.dart';
import 'package:transifox/widgets/textfieldd.riverpod.dart';

class Tasa extends StatefulWidget {
  const Tasa({super.key});

  @override
  State<Tasa> createState() => _TasaState();
}

class _TasaState extends State<Tasa> {
  bool isCompuesto = false;

  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: const [0.2, 0.9],
      colors: [
        Colors.white,
        Colors.red[900]!,
      ],
    ),
  );

  String? selectedCalculation;
  IntereSimpleController gestionSimple = IntereSimpleController();
  IntereCompuestoController gestionCompuesto = IntereCompuestoController();

  //interes Simple
  final TextEditingController tasaController = TextEditingController();

  //capital para simple y compuesto
  final TextEditingController capitalControllerS = TextEditingController();
  final TextEditingController tiempoControllerS = TextEditingController();
  final TextEditingController interesimpleController = TextEditingController();

  //interes compuesto
  final TextEditingController montoCompuestoController =
      TextEditingController();
  final TextEditingController capitalControllerC = TextEditingController();
  final TextEditingController tiempoControllerC = TextEditingController();

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
        foregroundColor: Colors.red[900]!,
        title: const Text('Tasa de interés'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(decoration: boxDecoration),
          Container(
            padding: const EdgeInsets.only(bottom: 40),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: 800,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!isCompuesto) ...[
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: SizedBox(
                              width: 150,
                              child: TextfieldStyle(
                                  enabled: true,
                                  color: Colors.red[900]!,
                                  controller: interesimpleController,
                                  icon: Image.asset('assets/interes simple.png',
                                      width: 1),
                                  labelText: 'Interés Simple'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: SizedBox(
                              width: 150,
                              child: TextfieldStyle(
                                  enabled: true,
                                  color: Colors.red[900]!,
                                  controller: capitalControllerS,
                                  icon: Image.asset('assets/capital.png',
                                      width: 1),
                                  labelText: 'Capital'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: SizedBox(
                              width: 150,
                              child: TextfieldStyle(
                                  enabled: true,
                                  color: Colors.red[900]!,
                                  controller: tiempoControllerS,
                                  icon: Image.asset('assets/tiempo.png',
                                      width: 1),
                                  labelText: 'Tiempo'),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 150,
                            child: TextfieldStyle(
                                enabled: true,
                                color: Colors.red[900]!,
                                controller: tasaController,
                                icon: Image.asset('assets/tasa.png', width: 1),
                                labelText: 'tasa simple'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            FechaSelector(
                              color: Colors.red[900]!,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                //calcularTasaSimple
                                calcularTasainteresSimple();
                              },
                              child: const Text('Calcular'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            DropdownMenuItemButton(
                              color: Colors.red[900]!,
                            ),
                          ],
                        ),
                      ),
                    ] else ...[
                      SizedBox(
                        width: 150,
                        child: TextfieldStyle(
                            enabled: true,
                            color: Colors.red[900]!,
                            controller: tasaController,
                            icon: Image.asset('assets/tasa.png', width: 1),
                            labelText: 'Tasa Generada'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: SizedBox(
                              width: 150,
                              child: TextfieldStyle(
                                  enabled: true,
                                  color: Colors.red[900]!,
                                  controller: montoCompuestoController,
                                  icon: Image.asset('assets/montocom.png',
                                      width: 1),
                                  labelText: 'Monto Compuesto'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: SizedBox(
                              width: 150,
                              child: TextfieldStyle(
                                  enabled: true,
                                  color: Colors.red[900]!,
                                  controller: capitalControllerC,
                                  icon: Image.asset('assets/capitalcom.png',
                                      width: 1),
                                  labelText: 'Capital'),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: SizedBox(
                          width: 150,
                          child: TextfieldStyle(
                              enabled: true,
                              color: Colors.red[900]!,
                              controller: tiempoControllerC,
                              icon:
                                  Image.asset('assets/tiempocom.png', width: 1),
                              labelText: 'Tiempo'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[800]!,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          calcularTasaCompuesto();
                        },
                        child: const Text('Calcular'),
                      )
                    ],
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              isCompuesto = false;
                            });
                            showSnackbar(
                                context, "Simple activado", Colors.green);
                          },
                          child: const Text('Modo Simple'),
                        ),
                        const SizedBox(width: 17),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow[800]!,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              isCompuesto = true;
                            });
                            showSnackbar(context, "Compuesto activado",
                                Colors.yellow[800]!);
                          },
                          child: const Text('Modo Compuesto'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String labelText, String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: SizedBox(
        width: 150,
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Interés',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(6),
              child: Image.asset('assets/interescom.png', width: 1),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
      ),
    );
  }

  //compuesto
  void calcularTasaCompuesto() async {
    try {
      double? montoCompuesto =
          double.tryParse(montoCompuestoController.text.trim());
      double? capital = double.tryParse(capitalControllerC.text.trim());
      double? tiempo = double.tryParse(tiempoControllerC.text.trim());

      // Se permite que los valores sean null
      InteresCompuesto interesCompu = InteresCompuesto(
          Monto_Compuesto: montoCompuesto,
          Capital: capital,
          Tasa_Interes: null,
          Tiempo: tiempo,
          Interes_Compuesto: 0);

      Map<String, dynamic> resultado =
          await gestionCompuesto.registrarCompuesto(interesCompu);

      print(resultado);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Interés Calculado con éxito')),
      );

      // Evita asignar null a los controladores
      tasaController.text = resultado["Tasa_Interes"]?.toString() ?? "";
      montoCompuestoController.text =
          resultado["Monto_Compuesto"]?.toString() ?? "";
      tiempoControllerC.text = resultado["Tiempo"]?.toString() ?? "";
      capitalControllerC.text = resultado["Capital"]?.toString() ?? "";
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al registrar interés: $e')),
      );
    }
  }

  //informacion tasa
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
              Icon(Icons.info, color: Colors.red[900]),
              SizedBox(width: 8),
              Text('¿Qué es la Tasa de Interés?',
                  style: TextStyle(color: Colors.red[900], fontSize: 15)),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'La tasa de interés es el porcentaje que se cobra o se paga por el uso de una cantidad de dinero durante un período determinado.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 15),
                Text(
                  '📌 Fórmula (Interés Simple):',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Tasa = Interés / (Capital × Tiempo)',
                ),
                SizedBox(height: 15),
                Text(
                  '📌 Fórmula (Interés Compuesto):',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Tasa = (Monto / Capital)^(1/Tiempo) - 1',
                ),
                SizedBox(height: 15),
                Text(
                  '💡 Se expresa comúnmente en forma anual, mensual o diaria, dependiendo del período de tiempo evaluado.',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cerrar', style: TextStyle(color: Colors.red[900])),
            ),
          ],
        );
      },
    );
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

  void calcularTasainteresSimple() async {
    try {
      double? capital = double.tryParse(capitalControllerS.text.trim());
      double? interesSimple =
          double.tryParse(interesimpleController.text.trim());

      double? tiempo = CalcularTiempo();

      // ignore: unnecessary_null_comparison
      if (tiempo != null) {
        tiempo =
            double.parse(tiempo.toStringAsFixed(2)); // Redondea a 2 decimales
      }

      // Se permite que los valores sean null
      InteresSimple interesSimpleObj = InteresSimple(
        Capital: capital,
        Interes_Simple: interesSimple,
        Monto: 0,
        Tasa_Interes: null,
        Tiempo: tiempo,
      );

      Map<String, dynamic> resultado =
          await gestionSimple.registrarInteres(interesSimpleObj);

      print(resultado);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Interés Calculado con éxito')),
      );

      // Evita asignar null a los controladores

      interesimpleController.text =
          resultado["Interes_Simple"]?.toString() ?? "";
      capitalControllerS.text = resultado["Capital"]?.toString() ?? "";
      tasaController.text = resultado["Tasa_Interes"]?.toString() ?? "";
      tiempoControllerS.text = resultado["Tiempo"]?.toString() ?? "";
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al registrar interés: $e')),
      );
    }
  }
}
