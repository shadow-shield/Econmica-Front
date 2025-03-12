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
      stops: [0.2, 0.9],
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
        title: Text('Tasa de interés'),
      ),
      bottomNavigationBar: CustomBottomNavigator(color: Colors.red[900]!),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(decoration: boxDecoration),
          Container(
            padding: EdgeInsets.only(bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    'Tasa de interés:',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.red[900]!,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto'),
                  ),
                  margin: EdgeInsets.only(bottom: 60),
                  height: 50,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(40)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      child: TextfieldStyle(
                        color: Colors.red[900]!,
                        icon: Container(
                          padding: EdgeInsets.all(6),
                          child: Image.asset('assets/valor.png', width: 1),
                        ),
                        labelText: 'Valor Presente',
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 180,
                      child: TextfieldStyle(
                        color: Colors.red[900]!,
                        icon: Container(
                          padding: EdgeInsets.all(6),
                          child: Image.asset('assets/valorf.png', width: 1),
                        ),
                        labelText: 'Valor Futuro',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      child: TextfieldStyle(
                        color: Colors.red[900]!,
                        icon: Container(
                          padding: EdgeInsets.all(6),
                          child: Image.asset('assets/periodo.png', width: 1),
                        ),
                        labelText: 'Periodo',
                      ),
                    ),
                    SizedBox(width: 10),
                    Opacity(
                      opacity: isCompuesto ? 0.5 : 1.0,
                      child: SizedBox(
                        width: 180,
                        child: TextField(
                          enabled: !isCompuesto,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:
                                isCompuesto ? Colors.red[900]! : Colors.white54,
                            suffixIcon: Container(
                              padding: EdgeInsets.all(6),
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
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownMenuItemButton(color: Colors.red[900]!),
                ),
                SizedBox(height: 20),
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
                          SnackBar(
                              content: Text("Simple activado"),
                              duration: Duration(seconds: 1),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.green),
                        );
                      },
                      child: Text('Modo Simple'),
                    ),
                    SizedBox(width: 17),
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
                              content: Text("Compuesto activado"),
                              duration: Duration(seconds: 1),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.yellow[800]!),
                        );
                      },
                      child: Text('Modo Compuesto'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900]!,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text('Calcular'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
