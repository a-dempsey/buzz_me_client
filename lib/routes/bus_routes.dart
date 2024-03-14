import 'dart:convert';
import 'dart:async';

import 'dart:io';
import 'dart:math';

import 'package:buzz_me/stops/bus_stops.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

import '../firebase_options.dart';

class BusRoute {
  final String to;
  final String from;
  final double time;

  BusRoute({
    required this.to,
    required this.from,
    required this.time,
  });
}

Future<void> getRoutes({
  required void Function() onFailureCallback,
  required void Function(List<BusRoute>) onSuccessCallback,

}) async {
 try {
   final List<String> stops = [];
   final List<List<double>> coords = [];
   List<double> b = [30.2, -4.1];
   List<List<double>> result = [];

   User? user = FirebaseAuth.instance.currentUser;
   if (user != null) {
     Future<String?> getToken() async {
       String? idToken = await user.getIdToken(true);
       return idToken;
     }

   String? token = await getToken();

   if (token != null) {
     try {
       final response = await http.post(
         Uri.parse('http://localhost:3000/getNearestRoutes'),
         headers: <String, String>{
           'Content-Type': 'application/json; charset=UTF-8',
         },
         body: jsonEncode(<String, String>{
           'auth': token,
           "latitude": 51.893324.toString(),
           "longitude": "-8.492030",
         }),
       );
       if (response.statusCode == 200) {
         print("HERE ?");
         final List<dynamic> parsed = json.decode(response.body);
         List<double> c = [54.175, -8.172];
         getStops(onFailureCallback: () {
           if (kDebugMode) {
             print("ERR: didn'/t get stops");
           }
         },
           onSuccessCallback: (List<BusStop> stopsList) {
             for (var stop in stopsList) {

               stops.add(stop.name.toString());
               coords.add([stop.latitude.toDouble(), stop.longitude.toDouble()]);
               // lat.add(stop.latitude.toDouble());
               // lng.add(stop.longitude.toDouble());
               //
             }for (List<double> sublist in coords) {
               List<double> subtracted = [];
               for (int i = 0; i < b.length; i++) {
                 subtracted.add(sublist[i] - b[i]);
               }
               result.add(subtracted);
               List<double> flattenedResult = result.expand((element) => element).toList();

               // Find the smallest value
               double smallestValue = flattenedResult.reduce((min, value) => min < value ? min : value);
                print(smallestValue);
             }},);
          print(result);


         // final name = parsed['results'][0]['address_components'][0]['long_name'];
         // //       final lat = parsed['results'][0]['geometry']['location']['lat'];
         // //       final lng = parsed['results'][0]['geometry']['location']['lng'];
         // //
         //       nearestStops.add(
         //         BusRoute(
         //           name: name,
         //           latitude: lat,
         //           longitude: lng,
         //         ),
         //       );
         // //       onSuccessCallback(stationsList);
         // //     } else {
         // //       onFailureCallback();
         // //     }
       }
     } catch (e) {
       print(e);
     }
   }
   }
    // var response = await http.get(Uri.parse('http://localhost:3000/getNearestRoutes'));

  // //
  // //   for (int i = 0; i < locations.length; i ++) {
  // //     final String location = locations[i];
  // //     var response = await http.get(
  // //       Uri.parse(
  // //           'https://maps.googleapis.com/maps/api/geocode/json?&address=$location&key=AIzaSyACvY1ZY8DDj3E8htxZE4CHISOtDJv9Rek'),
  // //     );
  // //     if (response.statusCode == 200) {

  // //
  // //       final name = parsed['results'][0]['address_components'][0]['long_name'];
  // //       final lat = parsed['results'][0]['geometry']['location']['lat'];
  // //       final lng = parsed['results'][0]['geometry']['location']['lng'];
  // //
  // //       stationsList.add(
  // //         BusStop(
  // //           name: name,
  // //           latitude: lat,
  // //           longitude: lng,
  // //         ),
  // //       );
  // //       onSuccessCallback(stationsList);
  // //     } else {
  // //       onFailureCallback();
  // //     }
    }
   catch (e) {
   print(e);
   print("WHY NOT??");

  }
}