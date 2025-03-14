import 'package:flutter/material.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';
import 'package:transifox/widgets/bottonavigator.riverpod.dart';

class InteresCompuesto extends StatefulWidget {
  const InteresCompuesto({super.key});

  @override
  State<InteresCompuesto> createState() => _InteresCompuestoState();
}

class _InteresCompuestoState extends State<InteresCompuesto> {
  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.2, 0.9],
      colors: [
        Colors.white,
        Colors.yellow[800]!,
      ],
    ),
  );

  String? selectedCalculation;

  final TextEditingController interesController = TextEditingController();
  final TextEditingController capitalController = TextEditingController();
  final TextEditingController montoController = TextEditingController();
  final TextEditingController tiempoController = TextEditingController();
  final TextEditingController interesCompuestoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.yellow[800]!,
          title: Text('Interés Compuesto'),
        ),
        bottomNavigationBar: CustomBottomNavigator(
          color: Colors.yellow[800]!,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: boxDecoration,
            ),
            Container(
              padding: EdgeInsets.only(top: 210),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.yellow[800]!, width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red,
                                  blurRadius: 5,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedCalculation,
                                hint: Text(
                                  'Seleccione qué calcular',
                                  style: TextStyle(
                                      color: Colors.yellow[800]!,
                                      fontWeight: FontWeight.bold),
                                ),
                                icon: Icon(Icons.arrow_drop_down,
                                    color: Colors.yellow[800]!, size: 30),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                isExpanded: true,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCalculation = newValue;
                                  });
                                },
                                items: [
                                  'Interés',
                                  'Capital',
                                  'Monto Compuesto',
                                  'Tiempo',
                                  'Interes Simple'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      child: Text(
                                        value,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 180,
                          child: TextField(
                            controller: interesCompuestoController,
                            enabled: selectedCalculation != 'Interés' && selectedCalculation != 'Interés Compuesto',
                            decoration: InputDecoration(
                              labelText: 'Interés Compuesto',
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(6),
                                child: Image.asset('assets/incompuesto.png', width: 1),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 180,
                              child: TextField(
                                controller: interesController,
                                enabled: selectedCalculation != 'Interés',
                                decoration: InputDecoration(
                                  labelText: 'Interés',
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Image.asset('assets/interescom.png', width: 1),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            SizedBox(
                              width: 180,
                              child: TextField(
                                controller: tiempoController,
                                enabled: selectedCalculation != 'Tiempo',
                                decoration: InputDecoration(
                                  labelText: 'Tiempo',
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Image.asset('assets/tiempocom.png', width: 1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 180,
                              child: TextField(
                                controller: capitalController,
                                enabled: selectedCalculation != 'Capital',
                                decoration: InputDecoration(
                                  labelText: 'Capital',
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Image.asset('assets/capitalcom.png', width: 1),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            SizedBox(
                              width: 180,
                              child: TextField(
                                controller: montoController,
                                enabled: selectedCalculation != 'Monto Compuesto',
                                decoration: InputDecoration(
                                  labelText: 'Monto Compuesto',
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Image.asset('assets/montocom.png', width: 1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    DropdownMenuItemButton(color: Colors.yellow[800]!),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[800]!,
                          foregroundColor: Colors.white),
                      onPressed: () {},
                      child: Text('Calcular'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
