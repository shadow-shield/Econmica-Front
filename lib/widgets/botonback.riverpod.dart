import 'package:flutter/material.dart';


class Boton_Back extends StatelessWidget {
  const Boton_Back({super.key, required this.ruta});

  final Widget ruta;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      alignment: Alignment.bottomCenter,
      icon: const Icon(Icons.arrow_back,size: 30,),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ruta),
        );
      },
    );
  }
}
