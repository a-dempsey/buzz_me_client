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
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(26),
            ),
            fillColor: Colors.grey.shade300,
            //#629fa7
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[600])),
           // color: Colors.cyan[800],
      ),
    );
  }
}