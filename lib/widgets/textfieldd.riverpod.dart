import 'package:flutter/material.dart';

class TextfieldStyle extends StatefulWidget {
  const TextfieldStyle({
    super.key,
    required this.labelText,
    required this.icon,
    required this.color,
    required this.controller,
    required this.enabled,
  });

  final String labelText;
  final Widget icon;
  final Color color;
  final bool enabled;
  final TextEditingController controller;

  @override
  _TextfieldStyleState createState() => _TextfieldStyleState();
}

class _TextfieldStyleState extends State<TextfieldStyle> {
  final FocusNode focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: isFocused ? 0.5 : 0.8,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.only(bottom: isFocused ? 20 : 0),
        child: TextField(
          focusNode: focusNode,
          enabled: widget.enabled,
          controller: widget.controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10),
              child: widget.icon,
            ),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: widget.color, width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: widget.color, width: 1),
            ),
            labelText: widget.labelText,
            labelStyle: TextStyle(color: widget.color),
          ),
        ),
      ),
    );
  }
}
