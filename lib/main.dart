import 'package:buzz_me/components/upcoming_notification.dart';
import 'package:buzz_me/notifications/notifications.dart';
import 'package:buzz_me/routes/nearest_routes.dart';
import 'package:buzz_me/stops/bus_stops.dart';
import 'package:buzz_me/stops/get_stops.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'components/selection_modal.dart';
import 'firebase_options.dart';
import '../authentication/authentication.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService().init();
  await Firebase.initializeApp(
    name: 'buzz-me-client',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await getRoutes(
    onFailureCallback: () {
      print("GET ROUTES FAILURE");
    },
    onSuccessCallback: (List<BusRoute> stopsList) {
      print("GET ROUTES SUCCESS");
      },
  );
  await getBusStops(
    onFailureCallback: () {
      print("GET stops FAILURE");
    },
    onSuccessCallback: (List<Stops> stopsList) {
      print("GET Stops SUCCESS");
    },
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authentication(),
    );
  }
}