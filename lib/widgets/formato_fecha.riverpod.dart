import 'package:flutter/material.dart';

ValueNotifier<String?> formatoSeleccionado = ValueNotifier<String?>(null);

class FechaSelector extends StatefulWidget {
  const FechaSelector({super.key});

  @override
  State<FechaSelector> createState() => _FechaSelectorState();
}

class _FechaSelectorState extends State<FechaSelector> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 220,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.white54,
              labelText: 'Formato',
              labelStyle: TextStyle(color: Colors.green),
            ),
            value: selectedOption,
            hint: const Text(
              'Formato',
              style: TextStyle(color: Colors.green),
            ),
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue;
              });
              formatoSeleccionado.value = newValue; // 🔥 Actualiza el ValueNotifier
            },
            items: ['Año, Mes, Día', 'Fecha Inicio - Fecha Fin']
                .map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.green),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
