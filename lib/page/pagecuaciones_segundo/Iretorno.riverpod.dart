import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:transifox/controller/Iretorno.controller.service.dart';
import 'package:transifox/model/interes_retorno.module.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';
import 'package:transifox/widgets/textfieldd.riverpod.dart';

class Iretorno extends StatefulWidget {
  const Iretorno({super.key});

  @override
  State<Iretorno> createState() => _IretornoState();
}

class _IretornoState extends State<Iretorno> {
  final boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.2, 0.9],
      colors: [Colors.white, Color(0xFF9C93FA)],
    ),
  );

  IRetorno_Controller InteregesGestion = IRetorno_Controller();

  final TextEditingController MontoController = TextEditingController();
  final TextEditingController NumeroPeriodosController =
      TextEditingController();

  List<TextEditingController> flujoControllers = [];
  List<Map<String, dynamic>> resultados = [];

  void generarCamposFlujo() {
    final nPeriodos = int.tryParse(NumeroPeriodosController.text) ?? 0;
    flujoControllers = List.generate(nPeriodos, (_) => TextEditingController());
    setState(() {});
  }

  bool camposFlujoCompletos() {
    for (var c in flujoControllers) {
      if (c.text.trim().isEmpty) return false;
    }
    return true;
  }

  List<int> obtenerFlujos() {
    return flujoControllers.map((c) => int.tryParse(c.text) ?? 0).toList();
  }

  Future<void> InteresRetorno() async {
    if (!camposFlujoCompletos()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, completa todos los flujos')),
      );
      return;
    }

    try {
      List<int> flujo = obtenerFlujos();
      double monto = double.parse(MontoController.text);
      double periodos = double.parse(NumeroPeriodosController.text);

      Tasa_Retorno tasaRetorno = Tasa_Retorno(
        Monto: monto,
        NumeroPeriodos: periodos,
        FlujosPorPeriodo: flujo,
      );

      var response = await InteregesGestion.registrarRetorno(tasaRetorno);

      if (response != null && response is List) {
        print('Respuesta: $response');
        setState(() {
          resultados = List<Map<String, dynamic>>.from(response);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Datos enviados correctamente')),
        );
      } else {
        print('No se recibió respuesta válida del servidor.');
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al enviar datos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interes Retorno'),
        foregroundColor: const Color(0xFF9C93FA),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => mostrarInfoInteresRetorno(context),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(decoration: boxDecoration),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Campo Monto y Número de Periodos
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 150,
                      child: TextfieldStyle(
                        enabled: true,
                        labelText: 'Monto',
                        icon: Image.asset('assets/rcaja.png', width: 1),
                        color: const Color(0xFF9C93FA),
                        controller: MontoController,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 60,
                      width: 150,
                      child: TextfieldStyle(
                        enabled: true,
                        labelText: 'Número de Periodos',
                        icon: Image.asset('assets/rtiempo.png', width: 1),
                        color: const Color(0xFF9C93FA),
                        controller: NumeroPeriodosController,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                /* const DropdownMenuItemButton(color: Color(0xFF9C93FA)), */
                const SizedBox(height: 20),

                // Botón para generar campos de flujo
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9C93FA),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: generarCamposFlujo,
                  child: const Text('Generar Flujos'),
                ),

                const SizedBox(height: 20),

                // Campos dinámicos para los flujos
                if (flujoControllers.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        for (int i = 0; i < flujoControllers.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: SizedBox(
                              height: 60,
                              width: 200,
                              child: TextField(
                                controller: flujoControllers[i],
                                decoration: InputDecoration(
                                  labelText: 'Flujo por periodo ${i + 1}',
                                  icon: Image.asset('assets/rperiodo.png'),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                const SizedBox(height: 20),

                // Botón para enviar datos
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF9C93FA),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: InteresRetorno,
                  child: const Text('Calcular TIR'),
                ),
                // Tabla de resultados
                if (resultados.isNotEmpty) ...[
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '📊 Resultados del cálculo TIR:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xFF4A4A4A),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              headingRowColor: MaterialStateColor.resolveWith(
                                  (states) => const Color(0xFF9C93FA)),
                              headingTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              dataRowColor:
                                  MaterialStateColor.resolveWith((states) {
                                int index = resultados.indexOf(resultados[
                                    states.index ??
                                        0]); // fallback if index null
                                return index % 2 == 0
                                    ? const Color(0xFFF5F5F5)
                                    : const Color(0xFFFFFFFF);
                              }),
                              columns: const [
                                DataColumn(label: Text('Periodo')),
                                DataColumn(label: Text('Flujo')),
                                DataColumn(label: Text('Descuento')),
                                DataColumn(label: Text('Valor Descontado')),
                                DataColumn(label: Text('TIR Estimado')),
                              ],
                              rows: resultados.map((item) {
                                return DataRow(cells: [
                                  DataCell(Text(item['periodo'].toString())),
                                  DataCell(Text(item['flujo'].toString())),
                                  DataCell(Text(item['descuento'].toString())),
                                  DataCell(
                                      Text(item['valorDescontado'].toString())),
                                  DataCell(
                                      Text(item['tir_estimado'].toString())),
                                ]);
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void mostrarInfoInteresRetorno(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Icon(Icons.trending_up, color: Color(0xFF9C93FA)),
              SizedBox(width: 8),
              Text('Interés de Retorno (TIR)',
                  style: TextStyle(color: Color(0xFF9C93FA))),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                    'La Tasa Interna de Retorno (TIR) es una medida usada para evaluar proyectos...'),
                SizedBox(height: 12),
                Text('📌 ¿Qué es la TIR?',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Es la tasa que hace que el VPN sea igual a cero.'),
                // Puedes mantener el resto igual
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cerrar', style: TextStyle(color: Color(0xFF9C93FA))),
            ),
          ],
        );
      },
    );
  }
}

extension on Set<WidgetState> {
  get index => null;
}
