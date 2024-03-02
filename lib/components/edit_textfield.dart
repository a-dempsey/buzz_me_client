import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const EditText({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder:  const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
              )
          ),
            fillColor: Colors.pink[300]!.withOpacity(0.01),
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white)),
      ),
    );
  }
}