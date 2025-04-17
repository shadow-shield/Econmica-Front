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
                        border: Border.all(color: Colors.brown[400]!, width: 2),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.brown,
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
                                  color: Colors.brown[400]!,
                                  fontWeight: FontWeight.bold),
                            ),
                            icon: Icon(Icons.arrow_drop_down,
                                color: Colors.brown[400]!, size: 30),
                            style: TextStyle(
                                color: Colors.brown[400]!, fontSize: 16),
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

                  // Mostrar campos según selección
                  if (selectedCalculation == 'Amortizacion Francesa') ...[
                    camposFrancesa()
                  ] else if (selectedCalculation == 'Amortizacion Aleman') ...[
                    camposAleman()
                  ] else if (selectedCalculation ==
                      'Amortizacion Americana') ...[
                    camposAmericana()
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

  // ======================
  // Campos para cada tipo
  // ======================

  Widget camposFrancesa() {
    return Column(
      children: [
        filaInput(CPeriodicaController, 'Cuota Periodica', 'assets/acuota.png'),
        const SizedBox(height: 10),
        filaInput(
            CPrestadoController, 'Capital Prestado', 'assets/acapital.png'),
        const SizedBox(height: 10),
        filaInput(TPeriodoController, 'Tasa Periodo', 'assets/atasa.png'),
        const SizedBox(height: 10),
        filaInput(NPeriodoController, 'Numero de pagos', 'assets/anumero.png'),
      ],
    );
  }

  Widget camposAleman() {
    return Column(
      children: [
        filaInput(CPeriodicaController, 'Cuota Periodica', 'assets/acuota.png'),
        const SizedBox(height: 10),
        filaInput(Cuota_enPeriodoController, 'Cuota en el periodo',
            'assets/ainteres.png'),
        const SizedBox(height: 10),
        filaInput(
            CPrestadoController, 'Capital Prestado', 'assets/acapital.png'),
        const SizedBox(height: 10),
        filaInput(
            TPeriodoController, 'Interes iniciales', 'assets/atasa.png'),
        const SizedBox(height: 10),
        const SizedBox(height: 10),
        filaInput(NPeriodoController, 'Numero de pagos', 'assets/anumero.png'),
      ],
    );
  }

  Widget camposAmericana() {
    return Column(
      children: [
        filaInput(
            CPrestadoController, 'Capital Prestado', 'assets/acapital.png'),
        const SizedBox(height: 10),
        filaInput(TPeriodoController, 'Tasa Periodo', 'assets/atasa.png'),
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
          height: 50,
          width: 310,
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
}
