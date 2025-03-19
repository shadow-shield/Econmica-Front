import 'package:flutter/material.dart';
import 'package:transifox/controller/anualidad.controller.service.dart';
import 'package:transifox/model/anualidades.module.dart';
import 'package:transifox/widgets/bottonavigator.riverpod.dart';

class Anualidad extends StatefulWidget {
  const Anualidad({super.key});

  @override
  State<Anualidad> createState() => _AnualidadState();
}

class _AnualidadState extends State<Anualidad> {
  final boxDecoration = BoxDecoration(
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
        foregroundColor: Colors.pink,
        title: Text('Anualidad'),
      ),
      bottomNavigationBar: CustomBottomNavigator(
        color: Colors.pink,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: boxDecoration,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButton<String>(
                  value: selectedCalculation,
                  hint: Text('Seleccione una opción'),
                  items: ['Valor Futuro', 'Valor Presente']
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCalculation = newValue;
                    });
                  },
                ),
                SizedBox(height: 20),
                selectedCalculation == 'Valor Presente'
                    ? SizedBox(
                        width: 140,
                        child: TextField(
                          controller: valorPController,
                          enabled: selectedCalculation == 'Valor Presente',
                          decoration: InputDecoration(
                            labelText: selectedCalculation,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(6),
                              child: Image.asset('assets/tasa-de-interes.png',
                                  width: 1),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 140,
                        child: TextField(
                          controller: valorFController,
                          enabled: selectedCalculation == 'Valor Futuro',
                          decoration: InputDecoration(
                            labelText: selectedCalculation,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(6),
                              child: Image.asset('assets/tasanu.png', width: 1),
                            ),
                          ),
                        ),
                      ),
                SizedBox(height: 20),
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
                            child: TextField(
                              controller: tasaanualidadController,
                              decoration: InputDecoration(
                                labelText: 'Tasa Anualidad',
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(6),
                                  child: Image.asset('assets/tasanu.png',
                                      width: 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          SizedBox(
                            width: 140,
                            child: TextField(
                              controller: periodosanulidadController,
                              enabled: selectedCalculation != 'Tiempo',
                              decoration: InputDecoration(
                                labelText: 'Tiempo',
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(6),
                                  child: Image.asset('assets/tiempoanu.png',
                                      width: 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                        controller: montofijoController,
                        enabled: selectedCalculation != 'Anualidades',
                        decoration: InputDecoration(
                          labelText: 'Anualidades',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(6),
                            child: Image.asset('assets/anu.png', width: 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    calcularAnualidad();
                  },
                  child: Text('Calcular'),
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
      periodosanulidadController.text =resultado["Periodos_Capitalizacion"]?.toString() ?? "";
      tasaanualidadController.text =resultado["Tasa_Anualidad"]?.toString() ?? "";
      valorFController.text = resultado["Valor_Futuro"]?.toString() ?? "";
      valorPController.text = resultado["Valor_Presente"]?.toString() ?? "";
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al registrar la anualidad: ${e}')),
      );
    }
  }

  void limpiarCampos(String Seleccion) {
    if (Seleccion == 'Valor Presente') {
      valorPController.text = '';
      valorFController.text = 0.toString();
      ;
    }

    if (Seleccion == 'Valor Futuro') {
      valorFController.text = '';
      valorPController.text = 0.toString();
    }
  }
}
