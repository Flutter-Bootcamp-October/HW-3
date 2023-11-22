import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key, required this.labelText, required this.controller});
  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 10,
        shadowColor: Colors.black26,
        child: TextField(
          cursorColor: const Color.fromARGB(170, 101, 180, 150),
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(170, 101, 180, 150),
          ),
          controller: controller,
          decoration: InputDecoration(
            labelStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(170, 101, 180, 150),
            ),
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            label: Text(labelText),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(0, 0, 0, 0),
                ),
                borderRadius: BorderRadius.circular(20)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(0, 0, 0, 0),
                ),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    );
  }
}
