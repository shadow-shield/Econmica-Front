import 'package:flutter/material.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';
import 'package:transifox/widgets/formato_fecha.riverpod.dart';
import 'package:transifox/widgets/textfield.riverpod.dart';

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
      stops: [0.2, 0.9],
      colors: [
        Colors.white,
        Colors.brown[400]!,
      ],
    ),
  );

  final TextEditingController valorPFController = TextEditingController();
  final TextEditingController PCuotaController = TextEditingController();
  final TextEditingController Constante_Controller = TextEditingController();
  final TextEditingController TPeriodo_Controller = TextEditingController();
  final TextEditingController NPago_Controller = TextEditingController();
  final TextEditingController VPorcentaje = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.brown[400]!,
          title: Text('Gradientes'),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: boxDecoration,
            ),
            Container(
              padding: EdgeInsets.only(top: 160),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Valor ',
                              icon: Image.asset('assets/gvalor.png', width: 1),
                              color: Colors.brown[400]!,
                              controller: valorPFController,
                            ),
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Primera Cuota',
                              icon: Image.asset('assets/gcuota.png', width: 1),
                              color: Colors.brown[400]!,
                              controller: PCuotaController,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Constante Incremento',
                              icon: Image.asset('assets/gconsta.png', width: 1),
                              color: Colors.brown[400]!,
                              controller: Constante_Controller,
                            ),
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Tasa periodo',
                              icon: Image.asset('assets/gtasa.png', width: 1),
                              color: Colors.brown[400]!,
                              controller: TPeriodo_Controller,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Numero de pago',
                              icon: Image.asset('assets/gpago.png', width: 1),
                              color: Colors.brown[400]!,
                              controller: NPago_Controller,
                            ),
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextfieldStyle(
                              enabled: true,
                              labelText: 'Variable Porcentual',
                              icon: Image.asset('assets/gvariable.png', width: 1),
                              color: Colors.brown[400]!,
                              controller: VPorcentaje,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    FechaSelector(
                      color: Colors.brown[200]!,
                    ),
                    SizedBox(height: 20),
                    DropdownMenuItemButton(color: Colors.brown[400]!),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown[400]!,
                          foregroundColor: Colors.white),
                      onPressed: () {},
                      child: Text('Calcular'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
