import 'package:flutter/material.dart';
import 'package:transifox/controller/usuario.controller.service.dart';
import 'package:transifox/model/usuario.model.module.dart';
import 'package:transifox/page/Prestamos/Prestamos.riverpod.dart';
import 'package:transifox/page/auth/huella.riverpod.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  UsuarioController gestionUsuarios = UsuarioController();
  UsuarioController gestionUsuarioDb = UsuarioController();

  TextEditingController user_Cedula = TextEditingController();
  TextEditingController user_Clave = TextEditingController();
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
          foregroundColor: Colors.blue,
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
        controller: user_Clave,
      ),
    );
  }

  Widget inputcuenta() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: user_Cedula,
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
          /* Usuario usuario = Usuario(
            Email: '',
            Cedula: user_Cedula.text,
            Clave: user_Clave.text,
          );
          gestionUsuarios.verificarUser(usuario).then((value) {
            if (value) {
              print('Usuario correcto');
              Navigator.pushReplacementNamed(context, 'botones');
            } else {
              print('Usuario incorrecto');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Usuario o contraseña incorrectos'),
                ),
              );
            }
          }); */

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
