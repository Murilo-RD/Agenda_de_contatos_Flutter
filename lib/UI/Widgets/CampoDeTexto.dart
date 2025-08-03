import 'package:flutter/material.dart';

class CampoDeTexto extends StatelessWidget {
  CampoDeTexto({super.key,String? label}) : _label = label;
  String? _label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: _label,
          labelStyle: const TextStyle(
            color: Color(0xFFE5E5E5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
      style: const TextStyle(
        fontSize: 20,
        color: Color(0xFFE5E5E5),
      ),
    );
  }
}

