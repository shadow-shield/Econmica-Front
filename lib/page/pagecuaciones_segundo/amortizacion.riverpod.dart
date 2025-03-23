import 'package:flutter/material.dart';

class AmortizacionesState extends StatefulWidget {
  const AmortizacionesState({super.key});

  @override
  State<AmortizacionesState> createState() => _AmortizacionesStateState();
}

class _AmortizacionesStateState extends State<AmortizacionesState> {
  final boxDecoration = BoxDecoration(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Color(0xFFFAA89C),
          title: Text('Amortizaciones'),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: boxDecoration,
            )
          ],
        ));
  }
}
