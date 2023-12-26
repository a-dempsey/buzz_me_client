import 'package:buzz_me/screens/nav_screen.dart';
import 'package:buzz_me/screens/register_screen.dart';
import 'package:buzz_me/screens/search_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: LoginScreen(),
      //home: RegisterScreen(),
      home: NavScreen(),
    );
  }
}