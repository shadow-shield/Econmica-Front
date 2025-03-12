import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => BackgroundState();
}

class BackgroundState extends State<Background> {
  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.2, 0.9],
      colors: [
        Colors.white,
        Colors.blue[900]!,
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: boxDecoration,
        ),
        Positioned(
          top: -100,
          left: -30,
          child: _cajaBackground()
          )
      ],
    );
  }
}

// ignore: camel_case_types
class _cajaBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi/5,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[900]!,
              Colors.blueAccent
            ],
          ),
          borderRadius: BorderRadius.circular(80),
        ),
      ),
    );
  }
}
