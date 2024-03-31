import 'package:buzz_me/components/home_appbar.dart';
import 'package:buzz_me/components/timetable_appbar.dart';
import 'package:buzz_me/screens/search_screen.dart';
import 'package:buzz_me/screens/settings_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../components/icon.dart';
import '../components/navigation_bar.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});
  static int index = 1;

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  String _currentLocation = "";
  late LatLng _current;

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
      extendBodyBehindAppBar: true,
      appBar: NavScreen.index == 1
          ? const HomeAppBar() as PreferredSizeWidget
          : NavScreen.index == 2 ? const TimetableAppBar() as PreferredSizeWidget : null,
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
           Expanded(
            child: BottomNavBar(),
          ),
        ],
      ),
    );
  }
}