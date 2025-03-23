import 'package:flutter/material.dart';
import 'package:transifox/controller/interes_Simple.controller.service.dart';
import 'package:transifox/model/interes_Simple.model.module.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';

import 'package:transifox/widgets/formato_fecha.riverpod.dart';
import 'package:transifox/widgets/formato_fecha.riverpod.dart' as miNotifiers;

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
          foregroundColor: Colors.green,
          title: Text('Interes Simple'),
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
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.green, width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedCalculation,
                                hint: Text(
                                  'Seleccione qué calcular',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                icon: Icon(Icons.arrow_drop_down,
                                    color: Colors.green, size: 30),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
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
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      child: Text(
                                        value,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          width: 180,
                          child: TextField(
                            controller: interesimpleController,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 180,
                              child: TextField(
                                controller: montoController,
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
                    DropdownMenuItemButton(
                      color: Colors.green,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        calcularSimple();
                      },
                      child: Text('Calcular'),
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
        SnackBar(content: Text('Interés Calculado con éxito')),
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
      interesimpleController.text = '0.0'.toString();
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

    if (Seleccion == 'Interes Simple') {
      interesimpleController.clear();
      montoController.text = '';
    }
  }
}
