import 'package:flutter/material.dart';

class SavedRoutes extends StatelessWidget {
  const SavedRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70.0),
          child: Column(
            children: [
              const SizedBox(height: 35),
              // heading
              Text(
                'Your saved routes',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 24,
                  fontFamily: 'Roboto-Medium',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}