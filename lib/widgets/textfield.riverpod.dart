import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldStyle extends StatelessWidget {
  const TextfieldStyle(
      {super.key,
      required this.labelText,
      required this.icon,
      required this.color,
      required this.controller,
      required this.enabled});
  final String? labelText;
  final Widget icon;
  final Color? color;
  final bool enabled;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
      ],
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white54,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: icon,
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: color!, width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: color!, width: 1),
        ),
        labelText: labelText,
        labelStyle: TextStyle(color: color!),
      ),
    );
  }
}
