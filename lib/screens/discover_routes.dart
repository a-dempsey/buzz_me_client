import 'package:buzz_me/components/search_bar.dart';
import 'package:flutter/material.dart';

class DiscoverRoutes extends StatelessWidget {
  const DiscoverRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                // heading
                Text(
                  'Hi,\nWhere are you going today?',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 24,
                    fontFamily: 'Roboto-Medium',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 25),
                const Expanded(
                  child: LocationSearchBar(),
                ),

              ],
            ),
          ),
        ),
    );
  }
}

