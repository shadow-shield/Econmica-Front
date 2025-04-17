import 'package:flutter/material.dart';
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
      colors: [
        Colors.white,
        Color(0xFF9C93FA),
      ],
    ),
  );

  final TextEditingController I_InicialController = TextEditingController();
  final TextEditingController F_CajaController = TextEditingController();
  final TextEditingController Tasa_RetornoController = TextEditingController();
  final TextEditingController P_TiempoController = TextEditingController();
  final TextEditingController N_PeriodoController = TextEditingController();

  List<Map<String, dynamic>> resultados = [];

  void calcularFlujo() {
    resultados.clear();
    final flujoCaja = double.tryParse(F_CajaController.text) ?? 0;
    final nPeriodos = int.tryParse(N_PeriodoController.text) ?? 0;

    for (int i = 0; i <= nPeriodos; i++) {
      resultados.add({
        'anio': i,
        'flujo': flujoCaja,
      });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => mostrarInfoInteresRetorno(context),
          ),
        ],
        foregroundColor: const Color(0xFF9C93FA),
        title: const Text('Interes Retorno'),
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
                  // Fila 1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 150,
                        child: TextfieldStyle(
                          enabled: true,
                          labelText: 'Inversion Inicial',
                          icon: Image.asset('assets/rcaja.png', width: 1),
                          color: const Color(0xFF9C93FA),
                          controller: I_InicialController,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 150,
                        child: TextfieldStyle(
                          enabled: true,
                          labelText: 'Flujo de Caja',
                          icon: Image.asset('assets/rtiempo.png', width: 1),
                          color: const Color(0xFF9C93FA),
                          controller: F_CajaController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Fila 2
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 150,
                        child: TextfieldStyle(
                          enabled: true,
                          labelText: 'Tasa de Interes',
                          icon: Image.asset('assets/rperiodo.png', width: 1),
                          color: const Color(0xFF9C93FA),
                          controller: Tasa_RetornoController,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 60,
                        width: 150,
                        child: TextfieldStyle(
                          enabled: true,
                          labelText: 'Periodo Especifico',
                          icon: Image.asset('assets/rtasa.png', width: 1),
                          color: const Color(0xFF9C93FA),
                          controller: P_TiempoController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    height: 60,
                    width: 150,
                    child: TextfieldStyle(
                      enabled: true,
                      labelText: 'Numero total de años',
                      icon: Image.asset('assets/rtasa.png', width: 1),
                      color: const Color(0xFF9C93FA),
                      controller: N_PeriodoController,
                    ),
                  ),

                  const SizedBox(height: 20),
                  const DropdownMenuItemButton(color: Color(0xFF9C93FA)),
                  const SizedBox(height: 20),

                  // Botón Calcular
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9C93FA),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: calcularFlujo,
                    child: const Text('Calcular'),
                  ),

                  const SizedBox(height: 20),

                  if (resultados.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xFF9C93FA)),
                        columns: const [
                          DataColumn(label: Text('Año')),
                          DataColumn(label: Text('Flujo de Caja')),
                        ],
                        rows: resultados
                            .map(
                              (item) => DataRow(
                                cells: [
                                  DataCell(Text(item['anio'].toString())),
                                  DataCell(
                                      Text(item['flujo'].toStringAsFixed(2))),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                ],
              ),
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
              Text(
                'Interés de Retorno (TIR)',
                style: TextStyle(color: Color(0xFF9C93FA), fontSize: 16),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'La Tasa Interna de Retorno (TIR) es una medida utilizada en finanzas para evaluar la rentabilidad de un proyecto o inversión.',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 12),
                Text(
                  '📌 ¿Qué es la TIR?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'Es la tasa de interés que iguala el valor presente de los flujos de efectivo esperados con la inversión inicial. Es decir, el Valor Presente Neto (VPN) es igual a cero.',
                ),
                SizedBox(height: 12),
                Text(
                  '🔢 Fórmula general:',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'VPN = ∑ [ Fₜ / (1 + r)^t ] = 0',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                Text('• Fₜ: Flujo de caja en el período t'),
                Text('• r: Tasa interna de retorno (TIR)'),
                Text('• t: Número de período'),
                SizedBox(height: 12),
                Text(
                  '📊 Interpretación:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('• Si TIR > tasa mínima requerida ⇒ Proyecto viable'),
                Text('• Si TIR < tasa mínima requerida ⇒ Proyecto no rentable'),
                Text('• Si TIR = tasa mínima requerida ⇒ Punto de equilibrio'),
                SizedBox(height: 12),
                Text(
                  '💡 Nota:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'La TIR se calcula generalmente con métodos numéricos, ya que no se puede despejar directamente en la mayoría de los casos.',
                ),
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
