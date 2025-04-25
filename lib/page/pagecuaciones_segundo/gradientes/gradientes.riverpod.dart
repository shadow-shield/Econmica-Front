import 'package:flutter/material.dart';
import 'package:transifox/page/pagecuaciones_segundo/gradientes/gradientesaritmetico.riverpod.dart';
import 'package:transifox/page/pagecuaciones_segundo/gradientes/gradientesgreometricos.riverpod.dart';
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
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Gradientes_Aritmeticos()),
                      );
                    },
                    child: const Text('Gradiente Aritmético',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Gradientes_Geometricos()),
                      );
                    },
                    child: const Text('Gradiente Geométrico',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
              Icon(Icons.info, color: Colors.brown[400]!),
              const SizedBox(width: 8),
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
                  'Los gradientes son series de pagos que cambian con el tiempo...',
                  style: TextStyle(fontSize: 14),
                ),
                // Puedes mantener o editar el contenido informativo aquí...
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child:
                  Text('Cerrar', style: TextStyle(color: Colors.brown[400]!)),
            ),
          ],
        );
      },
    );
  }
}
