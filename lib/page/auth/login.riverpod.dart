import 'package:flutter/material.dart';
import 'package:transifox/page/auth/huella.riverpod.dart';

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
          decoration: const BoxDecoration(
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
                registerUser(),
                Huella(),
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
      padding: const EdgeInsets.all(0),
      child: TextButton(
        onPressed: () {
          print('boton de recuperar contraseña');
        },
        child: const Text('¿Olvidastes la contraseña?',
            style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget registerUser() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: TextButton(
        onPressed: () {
         Navigator.pushReplacementNamed(context, 'registro');
        },
        style: TextButton.styleFrom(
          foregroundColor:
              Colors.blue, 
        ),
        child: const Text(
          'Registrarse',
          style: TextStyle(
            color: Colors.white, 
            decoration: TextDecoration.underline, 
          ),
        ),
      ),
    );
  }

  Widget textoinicarsesion() {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        'Iniciar Sesión',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget inputclave() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock, color: Colors.white),
          hintText: 'Clave',
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget inputcuenta() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person, color: Colors.white),
          hintText: 'Cuenta',
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget botoninicarsesion() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        ),
        onPressed: () {
          //funcion verificar usuario
          
          Navigator.pushReplacementNamed(context, 'botones');
        },
        child: const Text(
          'Iniciar Sesión',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
