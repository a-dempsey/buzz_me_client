import 'package:flutter/material.dart';
import '../components/navigation_bar.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
             Expanded(
              child: BottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }
}