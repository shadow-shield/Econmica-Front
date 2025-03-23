import 'package:flutter/material.dart';

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
        Color(0xFFF2FA48),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Color(0xFFF2FA48),
          title: Text('Gradientes'),
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
