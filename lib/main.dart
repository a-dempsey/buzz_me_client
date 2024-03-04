import 'package:buzz_me/routes/bus_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import '../authentication/authentication.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'buzz-me-client',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  getRoutes(
    onFailureCallback: () {
      print("ERR: didn'/t get stops");
    },
    onSuccessCallback: (List<BusRoute> stopsList) {
      print("hi");
      // for (var stop in stopsList) {
      //
      // }
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