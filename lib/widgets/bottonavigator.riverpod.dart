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
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      backgroundColor: Colors.grey[250],
      selectedItemColor: widget.color,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          if (index == 0) {
            Navigator.pushNamed(context, 'botones');
          } else {
            Navigator.pushNamed(context, 'botones2');
          }
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/CalculosF.png', width: 33),
          label: 'Botones Corte 1',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/gestortasa.png', width: 33),
          label: 'Botones Corte 2',
        ),
      ],
    );
  }
}
