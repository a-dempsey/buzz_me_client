import 'dart:convert';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Stops {
  final String stationName;

  Stops({
    required this.stationName,
  });
}

Future<void> getBusStops({
  required void Function() onFailureCallback,
  required void Function(List<Stops>) onSuccessCallback,

}) async {
  try {
    final List<Stops> stopsList = [];

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
            Uri.parse('http://localhost:3000/getStops'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
              'auth': token,
            }),
          );
          if (response.statusCode == 200) {
            final List<dynamic> parsed = json.decode(response.body);
            for(int i = 0; i < parsed.length; i++){
              stopsList.add(Stops(stationName: parsed[i]['name']));
              // for(int j = 0; j < parsed.length; j ++){
              //   stopsList.add(Stops(stops: parsed[i]['route_timeslots'][i]['to'][j]['name']));
              // }

            }
            onSuccessCallback(stopsList);
          } else {
        onFailureCallback();
      }} catch (e) {
          onFailureCallback();
        }}}
  }
  catch (e) {
    onFailureCallback();
  }
}