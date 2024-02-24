import 'package:buzz_me/components/nearest_routes.dart';
import 'package:buzz_me/components/upcoming_notification.dart';

import 'package:buzz_me/screens/map_screen.dart';
import 'package:buzz_me/screens/search_screen.dart';
import 'package:buzz_me/screens/settings_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import '../components/icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPressed = false;
  bool isPressedRoute = false;
  String _currentLocation = "";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      String addr = await getCoords();
      setState(() {
        _currentLocation = addr;
      });
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  Future<String> getCoords() async{
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final currentLocation = await GeoCode().reverseGeocoding(
        latitude: position.latitude,
        longitude: position.longitude);

    final locationStr = currentLocation.streetAddress.toString();
    return locationStr;
  }

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

                        Text(
                        _currentLocation,
                        style: const TextStyle(
                           color: Colors.black,
                           fontFamily: 'Roboto-Medium',
                           fontSize: 20,
                           fontWeight: FontWeight.w800,
                         ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(icon: const Icon(Icons.search, size: 28), onPressed: () {showDialog(
                    context: context,
                    builder: (context) {
                      return const Dialog(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SearchScreen(),
                          ],
                        ),
                      );
                    },
                  );},),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12, bottom: 2),
                      child: IconButton(icon: const Icon(Icons.settings_outlined, size: 28),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsScreen(),
                            ),
                          );
                        },
                      ),
                  ),
                ],
            ),
            const SizedBox(height: 20),
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
            if(!isPressedRoute | (isPressedRoute && isPressed))
              const SizedBox(
                height:118,
               child: UpcomingNotification(),
             ),
              const SizedBox(height: 20),
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
                          NearestRoutes()
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