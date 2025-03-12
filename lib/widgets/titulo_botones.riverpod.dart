import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class TituloTexto extends StatelessWidget {
<<<<<<< HEAD
  const TituloTexto({super.key});

=======
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
<<<<<<< HEAD
        margin: const EdgeInsets.only(top: 20, right: 25),
=======
        margin: EdgeInsets.only(top: 20, right: 25),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDown(
<<<<<<< HEAD
              duration: const Duration(milliseconds: 1000),
              child: const Text(
=======
              duration: Duration(milliseconds: 1000),
              child: Text(
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                'Tu dinero, tu control, tu futuro',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
<<<<<<< HEAD
            const SizedBox(height: 20),
            FadeInUp(
              duration: const Duration(milliseconds: 1200),
              child: const Text(
=======
            SizedBox(height: 20),
            FadeInUp(
              duration: Duration(milliseconds: 1200),
              child: Text(
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                'Gestión financiera ágil e inteligente con TransiFox',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
