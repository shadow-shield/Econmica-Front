import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class DropdownMenuItemButton extends StatefulWidget {
  final Color color;

  const DropdownMenuItemButton({super.key, required this.color});

  @override
  State<DropdownMenuItemButton> createState() => _DropdownMenuItemButtonState();
}

class _DropdownMenuItemButtonState extends State<DropdownMenuItemButton> {
  String? selectedValue; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140, 
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: widget.color),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.color, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.color, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white54,
          labelText: 'Periodo',
          labelStyle: TextStyle(color: widget.color),
        ),
        dropdownColor: Colors.white,
        iconEnabledColor: widget.color,
        value: selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
        items: [
          DropdownMenuItem(
              value: 'opcion1',
              child: Text('Anual', style: TextStyle(color: widget.color))),
          DropdownMenuItem(
              value: 'opcion2',
              child: Text('Semestral', style: TextStyle(color: widget.color))),
          DropdownMenuItem(
              value: 'opcion3',
              child: Text('Mensual', style: TextStyle(color: widget.color))),
          DropdownMenuItem(
              value: 'opcion4',
              child: Text('Semanal', style: TextStyle(color: widget.color))),
          DropdownMenuItem(
              value: 'opcion5',
              child: Text('Diario', style: TextStyle(color: widget.color))),
        ],
      ),
    );
  }
}
