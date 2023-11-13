import 'package:flutter/material.dart';

class GoogleSignIn extends StatelessWidget {
  final String imagePath;
  const GoogleSignIn({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset(
        imagePath,
        height: 60,
      ),
    );
  }
}