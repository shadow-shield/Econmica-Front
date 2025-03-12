import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Loginfondo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                textoinicarsesion(),
                inputcuenta(),
                inputclave(),
                botoninicarsesion(),
                recuContrasena(),
              ],
            )
            // Aquí va el contenido del login
          ],
        ),
      ],
    ));
  }

  Widget recuContrasena() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextButton(
        onPressed: () {
          print('boton de recuperar contraseña');
        },
<<<<<<< HEAD
        child: const Text('¿Olvidastes la contraseña?',
=======
        child: Text('¿Olvidastes la contraseña?',
    );

  Widget textoinicarsesion() {
<<<<<<< HEAD
    return const Padding(
      padding: EdgeInsets.all(20.0),
=======
    return Padding(
      padding: const EdgeInsets.all(20.0),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
      child: Text(
          fontWeight: FontWeight.bold,
        ),
    );
  }

  Widget inputclave() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
<<<<<<< HEAD
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock, color: Colors.white),
          hintText: 'Clave',
          hintStyle: const TextStyle(
=======
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock, color: Colors.white),
          hintText: 'Clave',
          hintStyle: TextStyle(
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
    );
  }

  Widget inputcuenta() {
    return Padding(
      child: TextField(
<<<<<<< HEAD
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person, color: Colors.white),
          hintText: 'Cuenta',
          hintStyle: const TextStyle(
=======
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person, color: Colors.white),
          hintText: 'Cuenta',
          hintStyle: TextStyle(
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
          backgroundColor: Colors.blue[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
<<<<<<< HEAD
=======
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
        ),
        onPressed: () {
          // Navegación a otra pantalla
          Navigator.pushReplacementNamed(context, 'botones');
        },
<<<<<<< HEAD
        child: const Text('Iniciar Sesión',style: TextStyle(color: Colors.white),),
=======
        child: Text('Iniciar Sesión',style: TextStyle(color: Colors.white),),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
      ),
    );
  }
}
