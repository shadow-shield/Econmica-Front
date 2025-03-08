import 'package:flutter/material.dart';

class DropdownMenuItemButton extends StatefulWidget {
  
    final Color color;

  const DropdownMenuItemButton({super.key, required this.color});

  @override
  State<DropdownMenuItemButton> createState() => DropdownMenuItemButtonState();
}

class DropdownMenuItemButtonState extends State<DropdownMenuItemButton> {
    


  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color:widget.color,), // Borde normal
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.color,width: 2), // Borde cuando no está enfocado
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.color, width: 3), // Borde cuando está enfocado
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white, // Fondo del input
        labelText: 'Seleccione un tiempo',
        labelStyle:
            TextStyle(color: widget.color,), // Color del texto de etiqueta
      ),
      dropdownColor: Colors.white,
      iconEnabledColor: widget.color,
      value: null, // Valor inicial
      onChanged: (String? newValue) {
        setState(() {});
      },
      items: [
        DropdownMenuItem(
            value: 'opcion1',
            child: Text('Anual', style: TextStyle(color: widget.color,))),
        DropdownMenuItem(
            value: 'opcion2',
            child: Text('Semestral', style: TextStyle(color: widget.color,))),
        DropdownMenuItem(
            value: 'opcion3',
            child: Text('Mensual', style: TextStyle(color: widget.color,))),
        DropdownMenuItem(
            value: 'opcion4',
            child: Text('Semanal', style: TextStyle(color: widget.color,))),
        DropdownMenuItem(
            value: 'opcion5',
            child: Text('Diario', style: TextStyle(color: widget.color,))),
      ],
    );
  }
}
