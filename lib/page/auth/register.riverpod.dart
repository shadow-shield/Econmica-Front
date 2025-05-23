import 'package:flutter/material.dart';
import 'package:transifox/controller/usuario.controller.service.dart';
import 'package:transifox/model/usuario.model.module.dart';


class Registro_User extends StatefulWidget {
  const Registro_User({super.key});

  @override
  State<Registro_User> createState() => Registro_UserState();
}

class Registro_UserState extends State<Registro_User> {
  UsuarioController gestionUsuarios = UsuarioController();

  TextEditingController user_Email = TextEditingController();
  TextEditingController user_Cedula = TextEditingController();
  TextEditingController user_Clave = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            'assets/fondoapp.png',
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 280),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                  ),
                  label: const Text(
                    'Atras',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Image.asset(
                    'assets/back.gif',
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/fondoregistrar.png"),
                        fit: BoxFit.contain,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "\n\nRegistrarse",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 11, top: 11),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.asset(
                                        'assets/nose.gif',
                                        width: 34,
                                        height: 34,
                                      ),
                                    )),
                                Expanded(
                                    child: TextField(
                                  decoration: const InputDecoration(
                                      hintStyle: TextStyle(color: Colors.white),
                                      hintText: "Cedula"),
                                  controller: user_Cedula,
                                ))
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10, right: 16),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.asset(
                                    'assets/clave.gif',
                                    width: 34,
                                    height: 34,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: TextField(
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: "Clave",
                                ),
                                controller: user_Clave,
                                obscureText: true,
                              )),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 16, bottom: 20, top: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.asset(
                                    'assets/contrasenaregi.gif',
                                    width: 34,
                                    height: 34,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: TextField(
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: "Correo Electronico",
                                ),
                                controller: user_Email,
                              )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 100, top: 20, right: 110),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.blue, width: 1.7),
                                  borderRadius: BorderRadius.circular(30)),
                              height: 40,
                              color: Colors.white,
                              child: Row(children: [
                                const Text(
                                  'Registrarse',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontFamily: AutofillHints.addressCity,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  'assets/siguiente.gif',
                                  height: 20,
                                  width: 20,
                                ),
                              ]),
                              onPressed: () {
                                registro(context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ]),
    );
  }

  void _register(BuildContext context, Usuario usuario) {
    String Cedula = user_Cedula.text.trim();
    String Clave = user_Clave.text.trim();
    String Correo = user_Email.text.trim();

    
    usuario.Cedula = Cedula;
    usuario.Clave = Clave;
    usuario.Email = Correo;

    gestionUsuarios.registrarUser(usuario);
  }

  void _mostrarError(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Error', style: TextStyle(color: Colors.blue)),
          content: Text(mensaje, style: const TextStyle(color: Colors.blue)),
          actions: <Widget>[
            TextButton(
              child: const Text('OK', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void registro(BuildContext context) {
    Usuario usuario = Usuario(
        Email: user_Email.text,
        Cedula: user_Cedula.text,
        Clave: user_Clave.text);

    _register(context, usuario);
  }
}
