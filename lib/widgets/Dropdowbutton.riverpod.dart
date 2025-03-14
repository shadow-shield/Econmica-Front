import 'package:flutter/material.dart';

// 🔹 Global para almacenar el valor seleccionado
final ValueNotifier<String?> periodoNotifier = ValueNotifier<String?>(null);

class DropdownMenuItemButton extends StatelessWidget {
  final Color color;

  const DropdownMenuItemButton({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: ValueListenableBuilder<String?>(
        valueListenable: periodoNotifier,
        builder: (context, selectedValue, _) {
          return DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: color),
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.white54,
              labelText: 'Periodo',
              labelStyle: TextStyle(color: color),
            ),
            dropdownColor: Colors.white,
            iconEnabledColor: color,
            value: selectedValue,
            onChanged: (String? newValue) {
              periodoNotifier.value = newValue; 
            },
            items: [
              DropdownMenuItem(value: 'Anual', child: Text('Anual',style: TextStyle(color: color),)),
              DropdownMenuItem(value: 'Semestral', child: Text('Semestral',style: TextStyle(color: color))),
              DropdownMenuItem(value: 'Mensual', child: Text('Mensual',style: TextStyle(color: color))),
              DropdownMenuItem(value: 'Bimestral', child: Text('Bimestral',style: TextStyle(color: color))),
              DropdownMenuItem(value: 'Cuatrimestral', child: Text('Cuatrimestral',style: TextStyle(color: color))),
              DropdownMenuItem(value: 'Semanal', child: Text('Semanal',style: TextStyle(color: color))),
              DropdownMenuItem(value: 'Diario', child: Text('Diario',style: TextStyle(color: color))),
            ],
          );
        },
      ),
    );
  }
}
