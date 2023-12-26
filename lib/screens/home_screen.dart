import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:40),
            // heading
            Padding(
              padding: EdgeInsets.only(left: 25, bottom: 24),
              child: Text(
              'Discover routes',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontFamily: 'Roboto-Medium',
                fontWeight: FontWeight.w400,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}