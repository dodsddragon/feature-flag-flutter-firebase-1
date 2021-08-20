import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final Icon? icone;
  final TextInputType? textInputType;

  Editor({this.controlador, this.rotulo, this.dica, this.icone, this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24),
        decoration:
        InputDecoration(icon: icone, labelText: rotulo, hintText: dica),
        keyboardType: textInputType,
      ),
    );
  }
}
