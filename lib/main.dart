import 'package:buzz_me/components/upcoming_notification.dart';
import 'package:buzz_me/notifications/notifications.dart';
import 'package:buzz_me/routes/nearest_routes.dart';
import 'package:buzz_me/screens/map_screen.dart';
import 'package:buzz_me/stops/bus_stops.dart';
import 'package:buzz_me/stops/get_stops.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'components/nearest_routes.dart';
import 'components/selection_modal.dart';
import 'firebase_options.dart';
import '../authentication/authentication.dart';
import '../routes/get_routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService().init();
  await Firebase.initializeApp(
    name: 'buzz-me-client',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await getBusRoutes(
    onFailureCallback: () {
      print("ERR: didn'/t get stops");
    },
    onSuccessCallback: (List<BusRoute> nearestRoutes) {
      for (var route in nearestRoutes) {
        NearestRoutes.time = route.time;
        NearestRoutes.to = route.to;
        NearestRoutes.from = route.from;
      }},
  );


  getRoutes(
      onFailureCallback: () {
        print("ERR: didn'/t get routes");
      },
      onSuccessCallback: (Map<String, List<dynamic>> routesList, timeList) {
        for (var key in routesList.keys) {
          if(!MapScreen.routes.containsKey(key)) {
            MapScreen.routes[key] = [];
            MapScreen.stopName.add(key);
          }
          if (MapScreen.routes.containsKey(key)) {
            MapScreen.routes[key]?.add(routesList[key]);
          }
        }
        for (var key in timeList.keys) {
          if(!MapScreen.times.containsKey(key)) {
            MapScreen.times[key] = [];
          }
          if (MapScreen.times.containsKey(key)) {
            MapScreen.times[key]?.add(timeList[key]);
          }
        }
      }
  );
  // getStops(
  //   onFailureCallback: () {
  //     print("ERR: didn'/t get stops");
  //   },
  //   onSuccessCallback: (List<BusStop> stopsList) {
  //     for (var stop in stopsList) {
  //       lat.add(stop.latitude.toDouble());
  //       lng.add(stop.longitude.toDouble());
  //       counter += 1;
  //       getMarkerIcon();
  //       getStations();
  //     }},
  // );



  await getRoutes(
      onFailureCallback: () {
        print("ERR: didn'/t get routes");
      },
      onSuccessCallback: (Map<String, List<dynamic>> routesList, timeList) {

        print("GET ROUTES SUCCESS");
      }
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