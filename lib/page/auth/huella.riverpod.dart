import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

import 'package:transifox/page/paginabotones/botones.riverpod.dart';

class Huella extends StatefulWidget {
  const Huella({super.key});

  @override
  State<Huella> createState() => _HuellaState();
}

class _HuellaState extends State<Huella> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticated = false;
  bool _isBioFinger = false;
  bool _checkBio = false;

  @override
  void initState() {
    super.initState();
    _checkBiometric();
    _listBioAndFingerType();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: _starAuth,
            icon: const Icon(Icons.fingerprint, color: Colors.white, size: 50),
            iconSize: 80,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Ingrese su huella',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void _checkBiometric() async {
    try {
      final bio = await auth.canCheckBiometrics;
      setState(() {
        _checkBio = bio;
      });
      print('Biometric check: $_checkBio');
    } catch (e) {
      print(e.toString());
    }
  }

  void _listBioAndFingerType() async {
    late List<BiometricType> listType;
    try {
      listType = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e.message);
    }
    print('List Biometrics: $listType');
    if (listType.contains(BiometricType.fingerprint)) {
      setState(() {
        _isBioFinger = true;
      });
      print('Fingerprint is $_isBioFinger');
    }
  }

  void _starAuth() async {
    try {
      _isAuthenticated = await auth.authenticate(
        localizedReason: 'Escanea tu huella para autenticarte',
        authMessages: [
          const AndroidAuthMessages(
            signInTitle: 'Autenticación biométrica',
            cancelButton: 'Cancelar',
          ),
        ],
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      print(e.message);
    }
    if (_isAuthenticated) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => const BotonesInteres()));
    }
  }
}
