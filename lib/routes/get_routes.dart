import 'dart:convert';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class Routes {
  final Map<String, List<String>> routes; // intermediate stops
  final String time;

  Routes({
    required this.routes,
    required this.time,
  });
}

Future<void> getRoutes({
  required void Function() onFailureCallback,
  required void Function(Map<String, List<dynamic>>, Map<String, List<dynamic>>) onSuccessCallback,

}) async {
  try {
    final Map<String, List<dynamic>> routesList = {};
    final Map<String, List<dynamic>> timeList = {};
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
            for(int k = 0; k < parsed.length; k ++){
              if(!routesList.containsKey(routesList[parsed[k]['name']].toString())) {
                routesList[parsed[k]['name']] = [];
              }
              if(!timeList.containsKey(timeList[parsed[k]['name']].toString())) {
                timeList[parsed[k]['name']] = [];
              }
              for(int i = 0; i < parsed[k]['route_timeslots'][0]['to'].length; i++) {
                if (k == 1){
                  routesList[parsed[k]['name']]!.add([parsed[k]['route_timeslots'][0]['to'][i]['name'], parsed[k]['route_timeslots'][1]['to'][i]['name']]);
                }else {
                  routesList[parsed[k]['name']]!.add(parsed[k]['route_timeslots'][0]['to'][i]['name']);
                 }}
                }
            for(int i = 0; i < routesList.length; i ++){
              if (i == 1){
                timeList[parsed[i]['name']]!.add([parsed[i]['route_timeslots'][0]['time'], parsed[i]['route_timeslots'][1]['time']]);
              }else {
                timeList[parsed[i]['name']]!.add(
                    parsed[i]['route_timeslots'][0]['time']);
              }
            }
            onSuccessCallback(routesList, timeList);
          }} catch (e) {
          print(e);
          onFailureCallback();
        }}}
  }
  catch (e) {
    print(e);
    onFailureCallback();
  }
}