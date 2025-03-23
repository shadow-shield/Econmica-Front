import 'package:flutter/material.dart';

class Capitalizaciones extends StatefulWidget {
  const Capitalizaciones({super.key});

  @override
  State<Capitalizaciones> createState() => _CapitalizacionesState();
}

class _CapitalizacionesState extends State<Capitalizaciones> {
  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.2, 0.9],
      colors: [
        Colors.white,
        Color(0xFF3B3EF9),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Color(0xFF3B3EF9),
          title: Text('Capitalizaciones'),
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
