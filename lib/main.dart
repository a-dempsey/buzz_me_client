import 'package:buzz_me/screens/login_screen.dart';
import 'package:buzz_me/screens/nav_screen.dart';
import 'package:buzz_me/screens/register_screen.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
void main() {
=======
import 'firebase_options.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    name: 'buzz-me',
    options: DefaultFirebaseOptions.currentPlatform,
  );
>>>>>>> 20dd74a (firebase for project)
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    //  home: LoginScreen(),
     // home: RegisterScreen(),
      home: NavScreen(),
    );
  }
}