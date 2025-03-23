import 'package:flutter/material.dart';

class Iretorno extends StatefulWidget {
  const Iretorno({super.key});

  @override
  State<Iretorno> createState() => _IretornoState();
}

class _IretornoState extends State<Iretorno> {
  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.2, 0.9],
      colors: [
        Colors.white,
        Color(0xFF9C93FA),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Color(0xFF9C93FA),
          title: Text('Interes Retorno'),
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
