import 'package:flutter/material.dart';
import 'package:transifox/controller/interes_Compuesto.controller.service.dart';
import 'package:transifox/model/interes_Compuesto.module.dart';
import 'package:transifox/page/pageecuaciones/tasa.riverpod.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';
import 'package:transifox/widgets/bottonavigator.riverpod.dart';

class InteresCompuestoPage extends StatefulWidget {
  const InteresCompuestoPage({super.key});

  @override
  State<InteresCompuestoPage> createState() => _InteresCompuestoState();
}

class _InteresCompuestoState extends State<InteresCompuestoPage> {
  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.2, 0.9],
      colors: [
        Colors.white,
        Colors.yellow[800]!,
      ],
    ),
  );

  String? selectedCalculation;
  IntereCompuestoController gestionCompuesto = IntereCompuestoController();
  final TextEditingController TasainteresController = TextEditingController();
  final TextEditingController capitalController = TextEditingController();
  final TextEditingController montoController = TextEditingController();
  final TextEditingController tiempoController = TextEditingController();
  final TextEditingController interesCompuestoController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.yellow[800]!,
          title: Text('Interés Compuesto'),
        ),
        bottomNavigationBar: CustomBottomNavigator(
          color: Colors.yellow[800]!,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: boxDecoration,
            ),
            Container(
              padding: EdgeInsets.only(top: 210),
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
                              border: Border.all(
                                  color: Colors.yellow[800]!, width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red,
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
                                      color: Colors.yellow[800]!,
                                      fontWeight: FontWeight.bold),
                                ),
                                icon: Icon(Icons.arrow_drop_down,
                                    color: Colors.yellow[800]!, size: 30),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                isExpanded: true,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCalculation = newValue;
                                  });
                                },
                                items: [
                                  'Tasa De Interés',
                                  'Capital',
                                  'Monto Compuesto',
                                  'Tiempo',
                                  'Interes Compuesto'
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
                        SizedBox(height: 20),
                        SizedBox(
                          width: 180,
                          child: TextField(
                            controller: interesCompuestoController,
                            enabled: selectedCalculation != 'Interés' &&
                                selectedCalculation != 'Interés Compuesto',
                            decoration: InputDecoration(
                              labelText: 'Interés Compuesto',
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(6),
                                child: Image.asset('assets/incompuesto.png',
                                    width: 1),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 180,
                              child: TextField(
                                controller: TasainteresController,
                                enabled: selectedCalculation != 'Interés',
                                decoration: InputDecoration(
                                  labelText: 'Interés',
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Image.asset('assets/interescom.png',
                                        width: 1),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            SizedBox(
                              width: 180,
                              child: TextField(
                                controller: tiempoController,
                                enabled: selectedCalculation != 'Tiempo',
                                decoration: InputDecoration(
                                  labelText: 'Tiempo',
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Image.asset('assets/tiempocom.png',
                                        width: 1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 180,
                              child: TextField(
                                controller: capitalController,
                                enabled: selectedCalculation != 'Capital',
                                decoration: InputDecoration(
                                  labelText: 'Capital',
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Image.asset('assets/capitalcom.png',
                                        width: 1),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            SizedBox(
                              width: 180,
                              child: TextField(
                                controller: montoController,
                                enabled:
                                    selectedCalculation != 'Monto Compuesto',
                                decoration: InputDecoration(
                                  labelText: 'Monto Compuesto',
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Image.asset('assets/montocom.png',
                                        width: 1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    DropdownMenuItemButton(
                      color: Colors.yellow[800]!,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[800]!,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        calcularCompuesto();
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

  void calcularCompuesto() async {
    try {
      LimpiarCampos(selectedCalculation!);

      double? tasaCompuesto =
          double.tryParse(TasainteresController.text.trim());
      double? capital = double.tryParse(capitalController.text.trim());
      double? monto = double.tryParse(montoController.text.trim());
      double? tiempo = double.tryParse(tiempoController.text.trim());
      double? interesCompuesto =
          double.tryParse(interesCompuestoController.text.trim());

      if (tiempo != null) {
        tiempo =
            double.parse(tiempo.toStringAsFixed(2)); // Redondea a 2 decimales
      }

      // Se permite que los valores sean null
      InteresCompuesto interesCompu = InteresCompuesto(
          Monto_Compuesto: monto,
          Capital: capital,
          Tasa_Interes: tasaCompuesto,
          Tiempo: tiempo,
          Interes_Compuesto: interesCompuesto);

      Map<String, dynamic> resultado =
          await gestionCompuesto.registrarCompuesto(interesCompu);

      print(resultado);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Interés Calculado con éxito')),
      );

      // Evita asignar null a los controladores
      TasainteresController.text = resultado["Tasa_Interes"]?.toString() ?? "";
      montoController.text = resultado["Monto_Compuesto"]?.toString() ?? "";
      capitalController.text = resultado["Capital"]?.toString() ?? "";
      tiempoController.text = resultado["Tiempo"]?.toString() ?? "";
      interesCompuestoController.text =
          resultado["Interes_Compuesto"]?.toString() ?? "";
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al registrar interés: $e')),
      );
    }
  }

  void LimpiarCampos(String Seleccion) {
    if (Seleccion == 'Monto Compuesto') {
      montoController.text = '';
      interesCompuestoController.text = '0'.toString();
    }

    if (Seleccion == 'Interés') {
      TasainteresController.text = '0'.toString();
      tiempoController.text = '0'.toLowerCase();
      interesCompuestoController.text = '';
    }

    if (Seleccion == 'Capital') {
      capitalController.text = '';
      interesCompuestoController.text = '0'.toString();
    }

    if (Seleccion == 'Tasa De Interes') {
      tiempoController.clear();
      montoController.text = 0.toString();
    }

    if (Seleccion == 'Tiempo') {
      tiempoController.text = '';
      interesCompuestoController.text = '0'.toString();
    }
  }
}
