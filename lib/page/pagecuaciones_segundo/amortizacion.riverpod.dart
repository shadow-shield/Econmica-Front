import 'dart:math';

import 'package:flutter/material.dart';
import 'package:transifox/controller/amortizacion.controller.service.dart';
import 'package:transifox/model/amortizacion.module.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';
import 'package:transifox/widgets/textfield.riverpod.dart';
import 'package:transifox/widgets/textfieldd.riverpod.dart';

class AmortizacionesState extends StatefulWidget {
  const AmortizacionesState({super.key});

  @override
  State<AmortizacionesState> createState() => _AmortizacionesStateState();
}

class _AmortizacionesStateState extends State<AmortizacionesState> {
  final boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.2, 0.9],
      colors: [
        Colors.white,
        Color(0xFFFAA89C),
      ],
    ),
  );

  String? selectedCalculation;
  String? selectedPeriodicity;
  Amortizacion_Controller gestionAmortizacion = Amortizacion_Controller();
  final TextEditingController MontoController = TextEditingController();
  final TextEditingController TasaInteresController = TextEditingController();
  final TextEditingController PlazoController = TextEditingController();
  final TextEditingController TipoController = TextEditingController();

  // Aquí guardaremos los resultados de la amortización para mostrar en la tabla.
  List<Map<String, dynamic>> tablaAmortizacion = [];

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
        foregroundColor: const Color(0xFFFAA89C),
        title: const Text('Amortizaciones'),
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
                        border: Border.all(color: Color(0xFFFAA89C), width: 2),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFFAA89C),
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
                                  color: Color(0xFFFAA89C),
                                  fontWeight: FontWeight.bold),
                            ),
                            icon: Icon(Icons.arrow_drop_down,
                                color: Color(0xFFFAA89C), size: 30),
                            style: TextStyle(
                                color: Color(0xFFFAA89C), fontSize: 16),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCalculation = newValue;
                              });
                            },
                            items: [
                              'Amortizacion Francesa',
                              'Amortizacion Aleman',
                              'Amortizacion Americana'
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
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFFAA89C), width: 2),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFFAA89C),
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
                            value: selectedPeriodicity,
                            hint: Text(
                              'Seleccione Periodicidad',
                              style: TextStyle(
                                  color: Color(0xFFFAA89C),
                                  fontWeight: FontWeight.bold),
                            ),
                            icon: Icon(Icons.arrow_drop_down,
                                color: Color(0xFFFAA89C), size: 30),
                            style: TextStyle(
                                color: Color(0xFFFAA89C), fontSize: 16),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedPeriodicity = newValue;
                              });
                            },
                            items: [
                              'Anual',
                              'Mensual',
                              'Semanal',
                              'Trimestral',
                              'Cuatrimestral',
                              'Semestral',
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
                  if (selectedCalculation == 'Amortizacion Francesa') ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: camposAmortizaciones(),
                    )
                  ] else if (selectedCalculation == 'Amortizacion Aleman') ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: camposAmortizaciones(),
                    )
                  ] else if (selectedCalculation ==
                      'Amortizacion Americana') ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: camposAmortizaciones(),
                    )
                  ],
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFAA89C),
                        foregroundColor: Colors.white),
                    onPressed: () {
                      calcularAmortizaciones();
                    },
                    child: const Text('Calcular'),
                  ),
                  const SizedBox(height: 20),
                  // Aquí mostramos la tabla con los resultados de la amortización.
                  if (tablaAmortizacion.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Table(
                        border: TableBorder.all(
                          color: Colors.transparent,
                          width: 0,
                        ),
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                              color: Color(
                                  0xFFFAA89C), // Color de fondo para el encabezado
                            ),
                            children: [
                              _buildTableHeader('Periodo'),
                              _buildTableHeader('Saldo Inicial'),
                              _buildTableHeader('Amortización'),
                              _buildTableHeader('Interés'),
                              _buildTableHeader('Cuota Total'),
                              _buildTableHeader('Saldo Final'),
                            ],
                          ),
                          for (var row in tablaAmortizacion)
                            TableRow(
                              decoration: BoxDecoration(
                                color: Color(
                                    0xFFFAE1D0), // Color de fondo alternativo para las filas

                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              children: [
                                _buildTableCell(row['Periodo'].toString()),
                                _buildTableCell(row['SaldoInicial'].toString()),
                                _buildTableCell(row['Amortizacion'].toString()),
                                _buildTableCell(row['Interes'].toString()),
                                _buildTableCell(row['CuotaTotal'].toString()),
                                _buildTableCell(row['SaldoFinal'].toString()),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget camposAmortizaciones() {
    return Column(
      children: [
        Row(
          children: [
            filaInput(MontoController, 'Monto', 'assets/acuota.png'),
            const SizedBox(width: 10),
            filaInput(
                TasaInteresController, 'Tasa Interes', 'assets/acapital.png'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            filaInput(PlazoController, 'Plazo', 'assets/atasa.png'),
            const SizedBox(width: 10),
            tipoinput(TipoController, 'Tipo', 'assets/anumero.png'),
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
          width: 150,
          child: TextfieldStyle(
            enabled: true,
            labelText: label,
            icon: Image.asset(iconPath, width: 1),
            color: const Color(0xFFFAA89C),
            controller: controller,
          ),
        ),
      ],
    );
  }

  calcularAmortizaciones() async {
    double? Monto = double.tryParse(MontoController.text);
    double? TasaInteres = double.tryParse(TasaInteresController.text);
    double? Plazo = double.tryParse(PlazoController.text);
    String? Tipo = TipoController.text;

    double TasaDividida = TasaInteres! / 100; // Convertir a decimal
    if (selectedPeriodicity == 'Anual') {
      TasaInteres = TasaDividida / 12;
    } else if (selectedPeriodicity == 'Mensual') {
      TasaInteres = TasaDividida / 30;
    } else if (selectedPeriodicity == 'Semanal') {
      TasaInteres = TasaDividida / 7;
    } else if (selectedPeriodicity == 'Trimestral') {
      TasaInteres = TasaDividida / 3;
    } else if (selectedPeriodicity == 'Cuatrimestral') {
      TasaInteres = TasaDividida / 4;
    } else if (selectedPeriodicity == 'Semestral') {
      TasaInteres = TasaDividida / 6;
    }

    AmortizacionModel amortizacion = AmortizacionModel(
      Monto: Monto,
      TasaInteres: TasaInteres,
      Plazo: Plazo,
      Tipo: Tipo,
    );

    List<Map<String, dynamic>> resultado =
        await gestionAmortizacion.registrarAmortizacion(amortizacion);

    setState(() {
      // Guardamos el resultado en la lista para mostrarlo en la tabla.
      tablaAmortizacion = resultado;
    });
  }

  Widget tipoinput(
      TextEditingController controller, String label, String iconPath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 70,
          width: 150,
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
              Icon(Icons.account_balance, color: Colors.brown[400]),
              SizedBox(width: 8),
              Text(
                'Sistemas de Amortización',
                style: TextStyle(color: Colors.brown[400], fontSize: 16),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Francesa
                Text(
                  '📌 Amortización Francesa:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'Las cuotas son constantes. Al inicio se paga más interés y menos capital. Al final, más capital y menos interés.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 6),
                Text(
                  'Fórmula:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'A = P × [ i × (1 + i)^n ] / [ (1 + i)^n – 1 ]',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                SizedBox(height: 20),

                // Alemana
                Text(
                  '📌 Amortización Alemana:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'La amortización del capital es constante. Las cuotas disminuyen con el tiempo, ya que los intereses bajan.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 6),
                Text(
                  'Fórmulas:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Amortización = P / n',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                Text(
                  'Interés_t = Saldo_t × i',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                Text(
                  'Cuota_t = Amortización + Interés_t',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                SizedBox(height: 20),

                // Americana
                Text(
                  '📌 Amortización Americana:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'Se pagan solo intereses periódicamente y todo el capital al final.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 6),
                Text(
                  'Fórmulas:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Interés = P × i',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                Text(
                  'Pago final = P + Interés',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                SizedBox(height: 20),

                // Aplicaciones
                Text(
                  '💡 Aplicaciones comunes:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('• Francesa: préstamos personales e hipotecarios'),
                Text('• Alemana: créditos empresariales, pagos decrecientes'),
                Text('• Americana: bonos, préstamos con pago único de capital'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child:
                  Text('Cerrar', style: TextStyle(color: Colors.green[700]!)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xFF4A3C31), // Color oscuro para el texto
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
      ),
    );
  }

// Función para crear los encabezados con un estilo más elegante
  Widget _buildTableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: Container(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white, // Color blanco para el encabezado
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
