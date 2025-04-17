import 'package:flutter/material.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';
import 'package:transifox/widgets/formato_fecha.riverpod.dart';
import 'package:transifox/widgets/textfieldd.riverpod.dart';

class Gradientes_SeriState extends StatefulWidget {
  const Gradientes_SeriState({super.key});

  @override
  State<Gradientes_SeriState> createState() => _Gradientes_SeriStateState();
}

class _Gradientes_SeriStateState extends State<Gradientes_SeriState> {
  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: const [0.2, 0.9],
      colors: [
        Colors.white,
        Colors.brown[400]!,
      ],
    ),
  );

  String? selectedCalculation;
  final TextEditingController valorPFController = TextEditingController();
  final TextEditingController P_PagoController = TextEditingController();
  final TextEditingController TasaI_Controller = TextEditingController();
  final TextEditingController NPeriodo_Controller = TextEditingController();
  final TextEditingController TCrecimiento_Controller = TextEditingController();
  final TextEditingController FactorC_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.brown[400]!,
          title: const Text('Gradientes'),
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
                          border:
                              Border.all(color: Colors.brown[400]!, width: 2),
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
                                'Gradiente Geometrico',
                                'Gradiente Aritmetico',
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
                    if (selectedCalculation != null)
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: TextfieldStyle(
                                  enabled: true,
                                  labelText: 'Valor ',
                                  icon: Image.asset('assets/gvalor.png',
                                      width: 1),
                                  color: Colors.brown[400]!,
                                  controller: valorPFController,
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: TextfieldStyle(
                                  enabled: true,
                                  labelText: 'Primer Pago',
                                  icon: Image.asset('assets/gcuota.png',
                                      width: 1),
                                  color: Colors.brown[400]!,
                                  controller: P_PagoController,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: TextfieldStyle(
                                  enabled: true,
                                  labelText: 'Tasa Interés',
                                  icon: Image.asset('assets/gconsta.png',
                                      width: 1),
                                  color: Colors.brown[400]!,
                                  controller: TasaI_Controller,
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: TextfieldStyle(
                                  enabled: true,
                                  labelText: 'Número de Periodo',
                                  icon:
                                      Image.asset('assets/gtasa.png', width: 1),
                                  color: Colors.brown[400]!,
                                  controller: NPeriodo_Controller,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: TextfieldStyle(
                                  enabled: true,
                                  labelText: 'Tasa de Crecimiento',
                                  icon:
                                      Image.asset('assets/gpago.png', width: 1),
                                  color: Colors.brown[400]!,
                                  controller: TCrecimiento_Controller,
                                ),
                              ),
                              if (selectedCalculation ==
                                  'Gradiente Geometrico') ...[
                                const SizedBox(width: 10),
                                SizedBox(
                                  height: 50,
                                  width: 150,
                                  child: TextfieldStyle(
                                    enabled: true,
                                    labelText: 'Factor de Conversión',
                                    icon: Image.asset('assets/gvariable.png',
                                        width: 1),
                                    color: Colors.brown[400]!,
                                    controller: FactorC_Controller,
                                  ),
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    FechaSelector(
                      color: Colors.brown[200]!,
                    ),
                    const SizedBox(height: 20),
                    DropdownMenuItemButton(color: Colors.brown[400]!),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown[400]!,
                          foregroundColor: Colors.white),
                      onPressed: () {},
                      child: const Text('Calcular'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
