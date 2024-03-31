import 'package:buzz_me/components/nearest_routes.dart';
import 'package:buzz_me/components/upcoming_notification.dart';
import 'package:buzz_me/screens/nav_screen.dart';
import 'package:flutter/material.dart';

import '../notifications/notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, Widget? widgetToShow});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPressed = false;
  bool isPressedRoute = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, -6),
                ),
              ],
            ),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto-Medium',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPressed = !isPressed;
                      },);
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(1),
                      minimumSize: MaterialStateProperty.all(const Size(14, 30)),
                      backgroundColor: isPressed ? MaterialStateProperty.all<Color>(Colors.pink.shade300.withOpacity(0.7)) : MaterialStateProperty.all<Color>(Colors.pink[100]!.withOpacity(0.9)),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child: const Text(
                       'Notifications'
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isPressedRoute = !isPressedRoute;
                    },);
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(1),
                    minimumSize: MaterialStateProperty.all(const Size(14,30)),
                    backgroundColor: isPressedRoute ? MaterialStateProperty.all<Color>(Colors.green.shade300.withOpacity(0.8)) : MaterialStateProperty.all<Color>(Colors.green.shade100.withOpacity(0.9)),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: const Text(
                      'Routes'
                  ),
                ),
              ],
            ),
            if(!isPressedRoute | (isPressedRoute && isPressed))
              const SizedBox(height: 20),
            if((!isPressedRoute) | (isPressedRoute && isPressed) )
              (UpcomingNotification.display == true && UpcomingNotification.time.isNotEmpty) ?  SizedBox(height: UpcomingNotification.time.length > 1 ? (128.0 + (65 * (UpcomingNotification.time.length - 1))) : (128.0), child: const UpcomingNotification()) : const SizedBox(height: 95, child: UpcomingNotification()),
            // (UpcomingNotification.display == true && UpcomingNotification.time.isNotEmpty) ? const SizedBox(height: 10) : const SizedBox(height: 10),
            const SizedBox(height: 10),
            if(!isPressed | (isPressedRoute && isPressed))
              Column(
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                        'Routes Nearest To You',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto-Medium',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 15),
                  Material(
                    elevation: 1,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 22,
                      padding: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.pink[100]?.withOpacity(0.2),
                        border: Border.all(
                          color: Colors.red.shade100,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          NearestRoutes(),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}