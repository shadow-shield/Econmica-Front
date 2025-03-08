import 'package:flutter/material.dart';
import 'package:transifox/widgets/bottonavigator.riverpod.dart';

class Anualidad extends StatefulWidget {
  const Anualidad({super.key});

  @override
  State<Anualidad> createState() => _AnualidadState();
}

class _AnualidadState extends State<Anualidad> {
  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.2, 0.9],
      colors: [
        Colors.white,
        Colors.pink,
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.pink,
        title: Text('Anualidad'),
      ),
      bottomNavigationBar: CustomBottomNavigator(color:Colors.pink ,),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: boxDecoration,
          )
        ],
      ),
    );
  }
}
