import 'package:flutter/material.dart';

// 🔹 Notificadores globales
ValueNotifier<String?> formatoSeleccionado = ValueNotifier<String?>(null);
ValueNotifier<Map<String, String?>> valoresFechas =
    ValueNotifier<Map<String, String?>>({
  'anio': null,
  'mes': null,
  'dia': null,
  'fechaInicio': null,
  'fechaFin': null,
});

class FechaSelector extends StatefulWidget {
  final Color color;

  const FechaSelector({super.key, required this.color});
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Seleccione el Formato de Fecha",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(height: 10),
          ValueListenableBuilder<String?>(
            valueListenable: formatoSeleccionado,
            builder: (context, selectedOption, child) {
              return DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.grey[200],
                  labelText: 'Formato',
                  labelStyle: TextStyle(color: widget.color),
                ),
                value: selectedOption,
                onChanged: (String? newValue) {
                  formatoSeleccionado.value = newValue;
                },
                items: ['Año, Mes, Día', 'Fecha Inicio - Fecha Fin']
                    .map((value) => DropdownMenuItem(
                        value: value,
                        child:
                            Text(value, style: TextStyle(color: widget.color))))
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 20),
          ValueListenableBuilder<String?>(
            valueListenable: formatoSeleccionado,
            builder: (context, selectedOption, child) {
              if (selectedOption == 'Año, Mes, Día') {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInputField('Año', anioController, 'anio'),
                    _buildInputField('Mes', mesController, 'mes'),
                    _buildInputField('Día', diaController, 'dia'),
                  ],
                );
              } else if (selectedOption == 'Fecha Inicio - Fecha Fin') {
                return Column(
                  children: [
                    _buildDateField(
                        'Fecha Inicio', fechaInicioController, 'fechaInicio'),
                    const SizedBox(height: 10),
                    _buildDateField(
                        'Fecha Fin', fechaFinController, 'fechaFin'),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  // 🔹 Función auxiliar para construir campos de entrada
  Widget _buildInputField(
      String label, TextEditingController controller, String key) {
    return SizedBox(
      width: 100,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: widget.color),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        onChanged: (value) {
          valoresFechas.value = {...valoresFechas.value, key: value};
        },
      ),
    );
  }

  // 🔹 Función auxiliar para construir selectores de fecha
  Widget _buildDateField(
      String label, TextEditingController controller, String key) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: widget.color),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.grey[200],
        suffixIcon: Icon(Icons.calendar_today, color: widget.color),
      ),
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
    );
  }
}
