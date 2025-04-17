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
          actions: [
            IconButton(
              icon: const Icon(Icons.info),
              onPressed: mostrarInfoTema,
            ),
          ],
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
                                height: 65,
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
                                height: 65,
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
                                height: 65,
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
                                height: 65,
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
                                height: 70,
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
                                  height: 65,
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
              Icon(Icons.info, color: Colors.brown[400]!),
              SizedBox(width: 8),
              Text(
                '¿Qué son los Gradientes?',
                style: TextStyle(color: Colors.brown[400]!, fontSize: 16),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Los gradientes son series de pagos que cambian con el tiempo. Estos pueden ser aritméticos (incremento fijo) o geométricos (incremento porcentual).',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 20),
                Text(
                  '📌 Gradiente Geométrico:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'Fórmula del valor futuro:',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'Vf = [ A * (1 + G)^n * (1 + i)^n ] / (G - i)',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                SizedBox(height: 8),
                Text(
                  'Donde:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('• Vf: Valor futuro del gradiente geométrico'),
                Text('• A: Valor del primer pago'),
                Text(
                    '• G: Tasa de crecimiento del gradiente (porcentaje decimal)'),
                Text('• i: Tasa de interés por período'),
                Text('• n: Número de períodos'),
                SizedBox(height: 20),
                Text(
                  '📌 Gradiente Aritmético:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'Fórmula del valor presente:',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'Vp = A × [ (1 - (1 + i)^-n) / i ] + (G / i) × [ (1 - (1 + i)^-n) / i - n / (1 + i)^n ]',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                SizedBox(height: 8),
                Text(
                  'Donde:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('• Vp: Valor presente del gradiente aritmético'),
                Text('• A: Valor constante de la anualidad'),
                Text('• G: Incremento aritmético constante por período'),
                Text('• i: Tasa de interés por período'),
                Text('• n: Número total de períodos'),
                SizedBox(height: 20),
                Text(
                  '💡 Estos modelos se utilizan para evaluar pagos futuros que aumentan o disminuyen progresivamente, como cuotas, rentas o sueldos escalonados.',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cerrar', style: TextStyle(color: Colors.brown[400]!)),
            ),
          ],
        );
      },
    );
  }
}
