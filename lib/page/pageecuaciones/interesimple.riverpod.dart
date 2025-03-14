import 'package:flutter/material.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';
import 'package:transifox/widgets/bottonavigator.riverpod.dart';
import 'package:transifox/widgets/formato_fecha.riverpod.dart';

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
                            enabled: selectedCalculation != 'Monto' &&
                                selectedCalculation != 'Interes Simple' &&
                                selectedCalculation != 'Tiempo',
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
                                enabled:
                                    selectedCalculation != 'Interes Simple' &&
                                        selectedCalculation != 'Monto' &&
                                        selectedCalculation != 'Tiempo',
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
                            enabled: selectedCalculation != 'Tiempo' &&
                                selectedCalculation != 'Interes Simple' &&
                                selectedCalculation != 'Monto' &&
                                selectedCalculation != 'Capital' &&
                                selectedCalculation != 'Tasa de interes',
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

  double CalcularTiempo() {
    var formato = 'AÑO,MES,DIA'; // Usa valores fijos si es este formato
    var ano = 4;
    var mes = 5;
    var dias = 20;

    String? periodo = periodoNotifier.value;
    String? formatoActual = formatoSeleccionado.value;

    DateTime fechaEspecifica = DateTime(2025, 3, 13);
    DateTime fechaEspecifica2 = DateTime(2026, 3, 13);

    Duration diferencia = fechaEspecifica2.difference(fechaEspecifica);
    double tiempo;

    // 🔹 Calcular tiempo base según el formato
    if (formatoActual == 'Año, Mes, Día') {
      tiempo = ano + (mes / 12) + (dias / 360);
    } else {
      tiempo = diferencia.inDays / 365;
    }

    // 🔹 Ajustar tiempo según el período
    switch (periodo) {
      case 'Anual':
        return tiempo;
      case 'Semestral':
        return tiempo * 2; // Un año tiene 2 semestres
      case 'Trimestral':
        return tiempo * 4; // Un año tiene 4 trimestres
      case 'Bimestral':
        return tiempo * 6; // Un año tiene 6 bimestres
      case 'Mensual':
        return tiempo * 12; // Un año tiene 12 meses
      case 'Semanal':
        return tiempo * 52.14; // Un año tiene aprox. 52.14 semanas
      case 'Diario':
        return tiempo * 365; // Convertimos a días
      default:
        throw Exception("Período no válido");
    }
  }
}
