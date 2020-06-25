import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final Icon icon;
  final String hintText;

  InputField(this.icon, this.hintText);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: icon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
