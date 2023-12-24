import 'package:flutter/material.dart';

import '../components/navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Expanded(
                child: BottomNavBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}