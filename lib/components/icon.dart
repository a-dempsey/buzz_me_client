import 'package:flutter/material.dart';

class IconImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  const IconImage({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset(
        imagePath,
        height: 70,
        width: 60,
      ),
    );
  }
}