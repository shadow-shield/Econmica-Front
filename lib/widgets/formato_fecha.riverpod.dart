import 'package:flutter/material.dart';

// 🔹 Notificadores globales
ValueNotifier<String?> formatoSeleccionado = ValueNotifier<String?>(null);
ValueNotifier<Map<String, String?>> valoresFechas = ValueNotifier<Map<String, String?>>({
  'anio': null,
  'mes': null,
  'dia': null,
  'fechaInicio': null,
  'fechaFin': null,
});

class FechaSelector extends StatefulWidget {
  @override
  _FechaSelectorState createState() => _FechaSelectorState();
}

class _FechaSelectorState extends State<FechaSelector> {
  final TextEditingController anioController = TextEditingController();
  final TextEditingController mesController = TextEditingController();
  final TextEditingController diaController = TextEditingController();
  final TextEditingController fechaInicioController = TextEditingController();
  final TextEditingController fechaFinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 Selector de formato
        ValueListenableBuilder<String?>(
          valueListenable: formatoSeleccionado,
          builder: (context, selectedOption, child) {
            return DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Formato',
              ),
              value: selectedOption,
              onChanged: (String? newValue) {
                formatoSeleccionado.value = newValue;
              },
              items: ['Año, Mes, Día', 'Fecha Inicio - Fecha Fin']
                  .map((value) => DropdownMenuItem(value: value, child: Text(value)))
                  .toList(),
            );
          },
        ),
        const SizedBox(height: 20),
        // 🔹 Campos dinámicos según formato
        ValueListenableBuilder<String?>(
          valueListenable: formatoSeleccionado,
          builder: (context, selectedOption, child) {
            if (selectedOption == 'Año, Mes, Día') {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildInputField('Año', anioController, 'anio'),
                  _buildInputField('Mes', mesController, 'mes'),
                  _buildInputField('Día', diaController, 'dia'),
                ],
              );
            } else if (selectedOption == 'Fecha Inicio - Fecha Fin') {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDateField('Fecha inicio', fechaInicioController, 'fechaInicio'),
                  SizedBox(width: 20),
                  _buildDateField('Fecha fin', fechaFinController, 'fechaFin'),
                ],
              );
            }
            return SizedBox.shrink();
          },
        ),
      ],
    );
  }

  // 🔹 Función auxiliar para construir campos de entrada
  Widget _buildInputField(String label, TextEditingController controller, String key) {
    return SizedBox(
      width: 100,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
        onChanged: (value) {
          valoresFechas.value = {...valoresFechas.value, key: value};
        },
      ),
    );
  }

  // 🔹 Función auxiliar para construir selectores de fecha
  Widget _buildDateField(String label, TextEditingController controller, String key) {
    return SizedBox(
      width: 140,
      child: TextField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(labelText: label, suffixIcon: Icon(Icons.calendar_today)),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (pickedDate != null) {
            controller.text = pickedDate.toLocal().toString().split(' ')[0];
            valoresFechas.value = {...valoresFechas.value, key: controller.text};
          }
        },
      ),
    );
  }
}
