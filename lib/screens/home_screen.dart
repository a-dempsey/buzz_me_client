import 'package:flutter/material.dart';
import 'package:buzz_me/components/menu_bar.dart';

import '../components/icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
                children : [
                  const IconImage(imagePath: 'assets/images/bus_home.jpeg', width: 10, height: 15),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 2),
                         child: Text(
                           'Location',
                           style: TextStyle(
                             color: Colors.grey[700],
                             fontFamily: 'Roboto-Medium',
                             fontSize: 16,
                             fontWeight: FontWeight.w400,
                           ),
                         ),
                       ),
                       const Text(
                         //TODO: fix w act loc
                        'Current Location',
                         style: TextStyle(
                           color: Colors.black,
                           fontFamily: 'Roboto-Medium',
                           fontSize: 20,
                           fontWeight: FontWeight.w800,
                         ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.search, size: 28),
                  const Padding(
                    padding: EdgeInsets.only(left: 12, right: 12, bottom: 2),
                      child: Icon(Icons.settings_outlined, size: 28),
                  ),
                ],
            ),
          ],
        ),
      ),
    );
  }
}