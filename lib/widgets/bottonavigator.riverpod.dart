import 'package:flutter/material.dart';

class CustomBottomNavigator extends StatefulWidget {
  const CustomBottomNavigator({super.key, required this.color});
  final Color color;

  @override
  _CustomBottomNavigatorState createState() => _CustomBottomNavigatorState();
}

class _CustomBottomNavigatorState extends State<CustomBottomNavigator> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
<<<<<<< HEAD
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
=======
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
>>>>>>> 2e1885980043156a74dc70922b6175dc212e620b
      backgroundColor: Colors.grey[250],
      selectedItemColor: widget.color,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          print('$index');
        });
      },
      items: [
        BottomNavigationBarItem(
          
          icon: Image.asset('assets/CalculosF.png',width: 33),
          label: 'Cálculos Financieros',
        ),
        BottomNavigationBarItem(
          icon:  Image.asset('assets/gestortasa.png',width: 33),
          label: 'Gestor de Tasas',
        ),
      ],
    );
  }
}
