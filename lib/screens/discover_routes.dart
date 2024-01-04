import 'package:flutter/material.dart';

class DiscoverRoutes extends StatelessWidget {
  const DiscoverRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(



          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 140),
                // heading
                Text(
                  'Buzz Me!',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 40,
                    fontFamily: 'Limelight',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

