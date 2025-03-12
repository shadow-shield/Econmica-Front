import 'package:flutter/material.dart';
import 'package:transifox/widgets/Dropdowbutton.riverpod.dart';
import 'package:transifox/widgets/bottonavigator.riverpod.dart';
import 'package:transifox/widgets/textfield.priverpod.dart';

class Tasa extends StatefulWidget {
  const Tasa({super.key});

  @override
  State<Tasa> createState() => _TasaState();
}

class _TasaState extends State<Tasa> {
  bool isCompuesto = false;

  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
<<<<<<< HEAD
      stops: const [0.2, 0.9],
=======
      stops: [0.2, 0.9],
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
      colors: [
        Colors.white,
        Colors.red[900]!,
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.red[900]!,
<<<<<<< HEAD
        title: const Text('Tasa de interés'),
=======
        title: Text('Tasa de interés'),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
      ),
      bottomNavigationBar: CustomBottomNavigator(color: Colors.red[900]!),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(decoration: boxDecoration),
          Container(
<<<<<<< HEAD
            padding: const EdgeInsets.only(bottom: 40),
=======
            padding: EdgeInsets.only(bottom: 40),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
<<<<<<< HEAD
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  margin: const EdgeInsets.only(bottom: 60),
                  height: 50,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(40)),
=======
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                  child: Text(
                    'Tasa de interés:',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.red[900]!,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto'),
                  ),
<<<<<<< HEAD
=======
                  margin: EdgeInsets.only(bottom: 60),
                  height: 50,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(40)),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      child: TextfieldStyle(
                        color: Colors.red[900]!,
                        icon: Container(
<<<<<<< HEAD
                          padding: const EdgeInsets.all(6),
=======
                          padding: EdgeInsets.all(6),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                          child: Image.asset('assets/valor.png', width: 1),
                        ),
                        labelText: 'Valor Presente',
                      ),
                    ),
<<<<<<< HEAD
                    const SizedBox(width: 10),
=======
                    SizedBox(width: 10),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                    SizedBox(
                      width: 180,
                      child: TextfieldStyle(
                        color: Colors.red[900]!,
                        icon: Container(
<<<<<<< HEAD
                          padding: const EdgeInsets.all(6),
=======
                          padding: EdgeInsets.all(6),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                          child: Image.asset('assets/valorf.png', width: 1),
                        ),
                        labelText: 'Valor Futuro',
                      ),
                    ),
                  ],
                ),
<<<<<<< HEAD
                const SizedBox(height: 10),
=======
                SizedBox(height: 10),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      child: TextfieldStyle(
                        color: Colors.red[900]!,
                        icon: Container(
<<<<<<< HEAD
                          padding: const EdgeInsets.all(6),
=======
                          padding: EdgeInsets.all(6),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                          child: Image.asset('assets/periodo.png', width: 1),
                        ),
                        labelText: 'Periodo',
                      ),
                    ),
<<<<<<< HEAD
                    const SizedBox(width: 10),
=======
                    SizedBox(width: 10),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                    Opacity(
                      opacity: isCompuesto ? 0.5 : 1.0,
                      child: SizedBox(
                        width: 180,
                        child: TextField(
                          enabled: !isCompuesto,
                          keyboardType:
<<<<<<< HEAD
                              const TextInputType.numberWithOptions(decimal: true),
=======
                              TextInputType.numberWithOptions(decimal: true),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:
                                isCompuesto ? Colors.red[900]! : Colors.white54,
                            suffixIcon: Container(
<<<<<<< HEAD
                              padding: const EdgeInsets.all(6),
=======
                              padding: EdgeInsets.all(6),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                              child:
                                  Image.asset('assets/interesg.png', width: 1),
                            ),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.red[900]!,
                                width: 3,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.red[900]!,
                                width: 3,
                              ),
                            ),
                            labelText: 'Interes Generado',
                            labelStyle: TextStyle(
                              color: isCompuesto
                                  ? Colors.grey[700]
                                  : Colors.red[900]!,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
<<<<<<< HEAD
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownMenuItemButton(color: Colors.red[900]!),
                ),
                const SizedBox(height: 20),
=======
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownMenuItemButton(color: Colors.red[900]!),
                ),
                SizedBox(height: 20),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isCompuesto = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
<<<<<<< HEAD
                          const SnackBar(
=======
                          SnackBar(
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                              content: Text("Simple activado"),
                              duration: Duration(seconds: 1),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.green),
                        );
                      },
<<<<<<< HEAD
                      child: const Text('Modo Simple'),
                    ),
                    const SizedBox(width: 17),
=======
                      child: Text('Modo Simple'),
                    ),
                    SizedBox(width: 17),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[800]!,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isCompuesto = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
<<<<<<< HEAD
                              content: const Text("Compuesto activado"),
                              duration: const Duration(seconds: 1),
=======
                              content: Text("Compuesto activado"),
                              duration: Duration(seconds: 1),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.yellow[800]!),
                        );
                      },
<<<<<<< HEAD
                      child: const Text('Modo Compuesto'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
=======
                      child: Text('Modo Compuesto'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900]!,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
<<<<<<< HEAD
                  child: const Text('Calcular'),
=======
                  child: Text('Calcular'),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
