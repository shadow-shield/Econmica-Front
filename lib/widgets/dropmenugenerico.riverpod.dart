/* import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class DropMenuGeneric extends StatefulWidget {
  String? selectedCalculation;
  final Color? color;
  final List<String> opciones;

  DropMenuGeneric({
    super.key,
    required this.selectedCalculation,
    required this.color,
    required this.opciones,
  });

  @override
  State<DropMenuGeneric> createState() => _DropMenuGenericState();
}

class _DropMenuGenericState extends State<DropMenuGeneric> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.brown[400]!, width: 2),
          boxShadow: const [
            BoxShadow(
              color: Colors.brown,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: 220,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: widget.selectedCalculation,
              hint: Text(
                'Seleccione Opción',
                style: TextStyle(
                  color: Colors.brown[400]!,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: Icon(Icons.arrow_drop_down,
                  color: Colors.brown[400]!, size: 30),
              style: TextStyle(color: Colors.brown[400]!, fontSize: 16),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  widget.selectedCalculation = newValue;
                });
              },
              items:
                  widget.opciones.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
 */