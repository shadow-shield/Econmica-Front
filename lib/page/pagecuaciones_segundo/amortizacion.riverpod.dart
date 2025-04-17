import 'package:flutter/material.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';
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

  final TextEditingController CPeriodicaController = TextEditingController();
  final TextEditingController CPrestadoController = TextEditingController();
  final TextEditingController TPeriodoController = TextEditingController();
  final TextEditingController NPeriodoController = TextEditingController();
  final TextEditingController CFijaController = TextEditingController();
  final TextEditingController CInteresController = TextEditingController();
  final TextEditingController CTotalController = TextEditingController();
  final TextEditingController Interes_PeriodoController =
      TextEditingController();
  final TextEditingController Cuota_enPeriodoController =
      TextEditingController();

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
                  const SizedBox(height: 20),
                  if (selectedCalculation == 'Amortizacion Francesa') ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: camposFrancesa(),
                    )
                  ] else if (selectedCalculation == 'Amortizacion Aleman') ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: camposAleman(),
                    )
                  ] else if (selectedCalculation ==
                      'Amortizacion Americana') ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: camposAmericana(),
                    )
                  ],
                  const SizedBox(height: 20),
                  const DropdownMenuItemButton(color: Color(0xFFFAA89C)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFAA89C),
                        foregroundColor: Colors.white),
                    onPressed: () {},
                    child: const Text('Calcular'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget camposFrancesa() {
    return Column(
      children: [
        Row(
          children: [
            filaInput(
                CPeriodicaController, 'Cuota Periodica', 'assets/acuota.png'),
            const SizedBox(width: 10),
            filaInput(
                CPrestadoController, 'Capital Prestado', 'assets/acapital.png'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            filaInput(TPeriodoController, 'Tasa Periodo', 'assets/atasa.png'),
            const SizedBox(width: 10),
            filaInput(
                NPeriodoController, 'Numero de pagos', 'assets/anumero.png'),
          ],
        ),
      ],
    );
  }

  Widget camposAleman() {
    return Column(
      children: [
        Row(
          children: [
            filaInput(
                CPeriodicaController, 'Cuota Periodica', 'assets/acuota.png'),
            const SizedBox(width: 10),
            filaInput(Cuota_enPeriodoController, 'Cuota en el periodo',
                'assets/ainteres.png'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            filaInput(
                CPrestadoController, 'Capital Prestado', 'assets/acapital.png'),
            const SizedBox(width: 10),
            filaInput(
                TPeriodoController, 'Interes iniciales', 'assets/atasa.png'),
          ],
        ),
        filaInput(NPeriodoController, 'Numero de pagos', 'assets/anumero.png'),
      ],
    );
  }

  Widget camposAmericana() {
    return Column(
      children: [
        Row(
          children: [
            filaInput(
                CPrestadoController, 'Capital Prestado', 'assets/acapital.png'),
            const SizedBox(width: 10),
            filaInput(TPeriodoController, 'Tasa Periodo', 'assets/atasa.png'),
          ],
        ),
        const SizedBox(height: 10),
        filaInput(
            Interes_PeriodoController, 'Interes Periodo', 'assets/gvalor.png'),
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
              Icon(Icons.info, color: Color(0xFFFAA89C)),
              SizedBox(width: 8),
              Text(
                'Sistemas de Amortización',
                style: TextStyle(color: Color(0xFFFAA89C), fontSize: 16),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Los sistemas de amortización definen cómo se pagan un préstamo o crédito en cuotas a lo largo del tiempo. Los más comunes son:',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 20),
                Text(
                  '📌 Sistema Francés:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'Cuota fija durante todo el periodo. Los intereses disminuyen y el abono a capital aumenta con el tiempo.',
                ),
                SizedBox(height: 6),
                Text(
                  'Fórmula de la cuota:',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'C = P × [ i × (1 + i)^n ] / [ (1 + i)^n - 1 ]',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                SizedBox(height: 6),
                Text(
                  'Donde:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('• C: Cuota fija'),
                Text('• P: Monto del préstamo'),
                Text('• i: Tasa de interés por periodo'),
                Text('• n: Número total de cuotas'),
                SizedBox(height: 20),
                Text(
                  '📌 Sistema Alemán:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'El abono a capital es fijo y los intereses van disminuyendo. Las cuotas son decrecientes.',
                ),
                SizedBox(height: 6),
                Text(
                  'Fórmula del abono a capital:',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'A = P / n',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                Text(
                  'Fórmula del interés del periodo:',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'I = P × i',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                Text(
                  'Fórmula de la cuota:',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'C = A + I',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                SizedBox(height: 6),
                Text(
                  'Donde:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('• A: Amortización constante de capital'),
                Text('• I: Interés sobre el saldo'),
                Text('• C: Cuota total del período'),
                Text('• P: Monto del préstamo'),
                Text('• i: Tasa de interés'),
                Text('• n: Número de cuotas'),
                SizedBox(height: 20),
                Text(
                  '📌 Sistema Americano:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'Solo se pagan intereses durante todo el periodo, y el capital se paga en una única cuota final.',
                ),
                SizedBox(height: 6),
                Text(
                  'Fórmula del interés periódico:',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'I = P × i',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                Text(
                  'Fórmula de la cuota final:',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'C_final = P + I',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                SizedBox(height: 6),
                Text(
                  'Donde:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('• I: Interés por período'),
                Text('• P: Monto del préstamo'),
                Text('• i: Tasa de interés'),
                Text('• C_final: Cuota final que incluye el capital'),
                SizedBox(height: 20),
                Text(
                  '💡 Elegir el sistema adecuado depende del flujo de caja del deudor, la predictibilidad de ingresos y la carga financiera que pueda asumir.',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cerrar',
                  style: TextStyle(color: const Color(0xFFFAA89C))),
            ),
          ],
        );
      },
    );
  }
}
