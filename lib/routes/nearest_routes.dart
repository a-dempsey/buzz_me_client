import 'dart:convert';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BusRoute {
  final String to;
  final String from;
  final String time;

  BusRoute({
    required this.to,
    required this.from,
    required this.time,
  });
}

Future<void> getBusRoutes({
  required void Function() onFailureCallback,
  required void Function(List<BusRoute>) onSuccessCallback,

}) async {
 try {
   final List<BusRoute> nearestRoutes = [];
   String scheduledTime = "";
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
         body: jsonEncode(<String, dynamic>{
           'auth': token,
           "latitude": 51.893324,
           "longitude": -8.492030,
         }),
       );
       if (response.statusCode == 200) {
         final List<dynamic> parsed = json.decode(response.body);
         List<double> c = [54.175, -8.172];

         final name = parsed[0]['name'];
         final time = parsed[0]['arrival_time'];
         final hours = time ~/ 3600;
         final r = time % 3600;
         final mins = r ~/ 60;
         if(mins >= 0 && mins< 10) {
           scheduledTime = "$hours:0$mins";
         } else if(hours >= 0 && hours < 10) {
           scheduledTime = "0$hours:$mins";
         } else if((hours >= 0 && mins >= 0) && (hours < 10 && mins < 10)) {
           scheduledTime = "0$hours:0$mins";
         }
         final destination = parsed[0]['destinations'][0]['name'];

         nearestRoutes.add(
           BusRoute(
             to: name,
             from: destination,
             time: scheduledTime,
           ),
         );
         onSuccessCallback(nearestRoutes.cast<BusRoute>());

       }} catch (e) {
       if (kDebugMode) {
         print(e);
       }
     }}}
    }
   catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}