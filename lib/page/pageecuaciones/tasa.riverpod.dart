import 'package:flutter/material.dart';
import 'package:transifox/widgets/bottonavigator.riverpod.dart';

class Tasa extends StatefulWidget {
  const Tasa({super.key});

  @override
  State<Tasa> createState() => _TasaState();
}

class _TasaState extends State<Tasa> {
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
        title: Text('Tasa de interes'),
      ),
      bottomNavigationBar: CustomBottomNavigator(color: Colors.red[900]!),
      body: Stack(
        fit: StackFit.expand,
        children: [Container(decoration: boxDecoration)],
      ),
    );
  }
}
