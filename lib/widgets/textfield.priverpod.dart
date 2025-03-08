import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldStyle extends StatelessWidget {
  const TextfieldStyle(
      {super.key, required this.labelText, required this.icon, required this.color});
  final String labelText;
  final Widget icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: icon,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: color, width: 3),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: color, width: 3),
        ),
        labelText: labelText,
        labelStyle: TextStyle(color: color),
      ),
    );
  }
}
