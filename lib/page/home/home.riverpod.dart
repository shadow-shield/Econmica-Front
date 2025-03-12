import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
<<<<<<< HEAD
      duration: const Duration(seconds: 2),
=======
      duration: Duration(seconds: 2),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
<<<<<<< HEAD
            decoration: const BoxDecoration(
=======
            decoration: BoxDecoration(
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
              image: DecorationImage(
                image: AssetImage('assets/fondoapp.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _fadeAnimation,
                child: Image.asset('assets/logo.png', width: 350, height: 200),
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: 200,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Horizon',
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            RotateAnimatedText('BIENVENIDO',textStyle: TextStyle(color: Colors.blue[800],fontWeight: FontWeight.bold,fontSize: 30)),
                            RotateAnimatedText('A',textStyle: TextStyle(color: Colors.blue[800],fontWeight: FontWeight.bold,fontSize: 30)),
                            RotateAnimatedText('TRANSIFOX',textStyle: TextStyle(color: Colors.blue[800],fontWeight: FontWeight.bold,fontSize: 30)),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
<<<<<<< HEAD
              const SizedBox(height: 20),
=======
              SizedBox(height: 20),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
              ScaleTransition(
                scale: _fadeAnimation,
                child:
                    Image.asset('assets/person.png', width: 220, height: 220),
              ),
<<<<<<< HEAD
              const SizedBox(height: 20),
              const SizedBox(height: 20),
=======
              SizedBox(height: 20),
              SizedBox(height: 20),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
              SizedBox(
                height: 42,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
<<<<<<< HEAD
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
=======
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'login');
                  },
<<<<<<< HEAD
                  child: const Row(
=======
                  child: Row(
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Continuar",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward_ios,
                          color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
