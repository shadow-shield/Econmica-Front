
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
      duration: Duration(seconds: 2),
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
            decoration: BoxDecoration(
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
              DefaultTextStyle(
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.blue[800]),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Bienvenido a Transifox', speed: Duration(milliseconds: 90)),
                  ],
                  totalRepeatCount: 1,
                ),
              ),
              SizedBox(height: 20),
              ScaleTransition(
                scale: _fadeAnimation,
                child: Image.asset('assets/person.png', width: 220, height: 220),
              ),
              SizedBox(height: 20),
              
              SizedBox(height: 20),
              SizedBox(
                height: 42,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  ),
                  onPressed: () {
                     Navigator.pushReplacementNamed(context, 'login');
                   
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Continuar", style: TextStyle(fontSize: 18,color: Colors.white),),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
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
