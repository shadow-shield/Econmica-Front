import 'package:flutter/material.dart';
import 'package:transifox/controller/interes_Simple.controller.service.dart';
import 'package:transifox/model/interes_Simple.model.module.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';
import 'package:transifox/widgets/bottonavigator.riverpod.dart';
import 'package:transifox/widgets/formato_fecha.riverpod.dart';

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
      stops: [0.2, 0.9],
      colors: [
        Colors.white,
        Colors.red[900]!,
      ],
    ),
  );

  String? selectedCalculation;
  IntereSimpleController gestionSimple = IntereSimpleController();

  final TextEditingController capitalController = TextEditingController();
  final TextEditingController tasaController = TextEditingController();
  final TextEditingController tiempoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.red[900]!,
        title: Text('Tasa de interés'),
      ),
      bottomNavigationBar: CustomBottomNavigator(color: Colors.red[900]!),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(decoration: boxDecoration),
          Container(
            padding: EdgeInsets.only(bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    'Tasa de interés:',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.red[900]!,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto'),
                  ),
                  margin: EdgeInsets.only(bottom: 30),
                  height: 50,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(40)),
                ),
                if (!isCompuesto) ...[
                  Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: SizedBox(
                          width: 150,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Interés Simple',
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(6),
                                child: Image.asset('assets/interes simple.png',
                                    width: 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: SizedBox(
                          width: 150,
                          child: TextField(
                            controller: capitalController,
                            decoration: InputDecoration(
                              labelText: 'Capital',
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(6),
                                child:
                                    Image.asset('assets/capital.png', width: 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: SizedBox(
                      width: 150,
                      child: TextField(
                        controller: tiempoController,
                        decoration: InputDecoration(
                          labelText: 'Tiempo',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(6),
                            child: Image.asset('assets/tiempo.png', width: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: SizedBox(
                          width: 150,
                          child: TextField(
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
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: SizedBox(
                          width: 150,
                          child: TextField(
                            controller: capitalController,
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
                      ),
                    ],
                  ),
                ],
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownMenuItemButton(
                    color: Colors.red[900]!,
                  ),
                ),
                SizedBox(height: 20),
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
                        showSnackbar(context, "Simple activado", Colors.green);
                      },
                      child: Text('Modo Simple'),
                    ),
                    SizedBox(width: 17),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[800]!,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isCompuesto = true;
                        });
                        showSnackbar(
                            context, "Compuesto activado", Colors.yellow[800]!);
                      },
                      child: Text('Modo Compuesto'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900]!,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    CalcularTiempo();
                  },
                  child: Text('Calcular'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String labelText, String assetPath) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: SizedBox(
        width: 150,
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Interés',
            prefixIcon: Padding(
              padding: EdgeInsets.all(6),
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
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
      ),
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

  void calcularTasa() async {
    try {
      LimpiarCampos(selectedCalculation!);

      double? capital = double.tryParse(capitalController.text.trim());

      double? tasaInteres = double.tryParse(tasaController.text.trim());
      double? tiempo = CalcularTiempo();

      if (tiempo != null) {
        tiempo =
            double.parse(tiempo.toStringAsFixed(2)); // Redondea a 2 decimales
      }

      // Se permite que los valores sean null
      InteresSimple interesSimpleObj = InteresSimple(
        Capital: capital,
        Interes_Simple: null,
        Monto: null,
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
    if (Seleccion == 'Capital') {
      capitalController.clear();
    }

    if (Seleccion == 'Tasa de interes') {
      tasaController.clear();
    }

    if (Seleccion == 'Tiempo') {
      tiempoController.clear();
    }
  }
}
