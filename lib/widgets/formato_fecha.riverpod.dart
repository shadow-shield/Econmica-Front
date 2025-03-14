import 'package:flutter/material.dart';

class FechaSelector extends StatefulWidget {
  const FechaSelector({super.key});

  @override
  State<FechaSelector> createState() => _FechaSelectorState();
}

class _FechaSelectorState extends State<FechaSelector> {
  String? selectedOption;

  final TextEditingController anioController = TextEditingController();
  final TextEditingController mesController = TextEditingController();
  final TextEditingController diaController = TextEditingController();
  final TextEditingController fechaInicioController = TextEditingController();
  final TextEditingController fechaFinController = TextEditingController();

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
            },
            items: ['Año, Mes, Día', 'Fecha Inicio - Fecha Fin']
                .map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyle(color: Colors.green),),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: 20),
        if (selectedOption == 'Año, Mes, Día') ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100,
                child: TextField(
                  controller: anioController,
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
                    labelText: 'Año',
                    labelStyle: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: TextField(
                  controller: mesController,
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
                    labelText: 'Mes',
                    labelStyle: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: TextField(
                  controller: diaController,
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
                    labelText: 'dia',
                    labelStyle: TextStyle(color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
        ] else if (selectedOption == 'Fecha Inicio - Fecha Fin') ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 140,
                child: TextField(
                  controller: fechaInicioController,
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
                    labelText: 'Fecha inicio',
                    labelStyle: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              SizedBox(
                width: 140,
                child: TextField(
                  controller: fechaFinController,
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
                    labelText: 'Fecha fin',
                    labelStyle: TextStyle(color: Colors.green),
                  ),
                ),
              ),
            ],
          )
        ],
      ],
    );
  }
}
