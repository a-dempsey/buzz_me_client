import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';

import '../screens/search_screen.dart';
import '../screens/settings_screen.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({super.key});
  // GET USER LOCATION -- REENABLE
  // String _currentLocation = "";
  // late LatLng _current;
  // static int index = 1;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _getCurrentLocation();
  //
  // }
  //
  // int getIndex(int i){
  //   return index;
  // }
  //
  // Future<void> _getCurrentLocation() async {
  //   try {
  //     String addr = await getCoords();
  //     setState(() {
  //       _currentLocation = addr;
  //     });
  //   } catch (err) {
  //     if (kDebugMode) {
  //       print(err);
  //     }
  //   }
  // }
  //
  // Future<String> getCoords() async{
  //   final position = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );
  //   final currentLocation = await GeoCode().reverseGeocoding(
  //       latitude: position.latitude,
  //       longitude: position.longitude);
  //
  //   final locationStr = currentLocation.streetAddress.toString();
  //   return locationStr;
  // }
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.pink[100]!.withOpacity(0.6),
        elevation: 0,
        toolbarHeight: 85,
        centerTitle: false,
        leading: const Padding(padding: EdgeInsets.only(left: 10),
          child: Image(
              image: AssetImage('assets/images/bus_home.png'),
              width: 10,
              height: 10
          ),
        ),
        leadingWidth: 68,
        title: Column(
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
              "Wilton",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto-Medium',
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),

        actions: [
          // IconButton(icon: const Icon(Icons.search, size: 28), onPressed: () {showDialog(
          //   context: context,
          //   builder: (context) {
          //     return const Dialog(
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: <Widget>[
          //           SearchScreen(),
          //         ],
          //       ),
          //     );
          //   },
          // );},),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 2),
            child: IconButton(icon: const Icon(Icons.settings_outlined, size: 28),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
          ),
        ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 25);
}
