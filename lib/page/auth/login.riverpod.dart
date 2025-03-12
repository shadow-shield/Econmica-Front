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
        child: Text('¿Olvidastes la contraseña?',
            style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget textoinicarsesion() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock, color: Colors.white),
          hintText: 'Clave',
          hintStyle: TextStyle(
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
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person, color: Colors.white),
          hintText: 'Cuenta',
          hintStyle: TextStyle(
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
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        ),
        onPressed: () {
          
          Navigator.pushReplacementNamed(context, 'botones');
        },
        child: Text('Iniciar Sesión',style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
