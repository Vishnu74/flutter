import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.hintText,
      required this.textInputType})
      : super(key: key);
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder();
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        //labelText: hintText,
        //labelStyle: TextStyle(fontSize: 24, color: Colors.blueGrey),
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        //filled: true,
        contentPadding: const EdgeInsets.all(10),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
