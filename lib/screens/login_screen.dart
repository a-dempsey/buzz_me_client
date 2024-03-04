import 'package:buzz_me/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/edit_textfield.dart';
import '../components/icon.dart';
import '../components/google_sign_in.dart';
import 'nav_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // text editing controllers
  static final usernameController = TextEditingController();
  static final passwordController = TextEditingController();

  String authError = "";

  Future<void> passwordReset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: "user@example.com");
  }

  Future<bool> login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text.trim(),
          password: passwordController.text.trim());
      return true;
    } on FirebaseAuthException catch (e) {
      setState(() {
        authError = "Incorrect username or password";
      });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300]!.withOpacity(0.8),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pink[300]!.withOpacity(0.8), Colors.white],
            stops: const [0.5, 0.9],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 2),
            // icon display
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // image
                IconImage(imagePath: 'assets/images/bus_icon.png', width: 60, height: 80),
              ],
            ),
            const SizedBox(height:30),
            // heading
            const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'Roboto-Medium',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'UCC Shuttle Bus Services',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Roboto-Regular',
              ),
            ),
            const SizedBox(height: 40),
            EditText(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            EditText(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 15),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                TextButton(
                  onPressed: () {
                    passwordReset();
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
            // const SizedBox(height: 75),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Divider(
              //           thickness: 0.6,
              //           color: Colors.grey[400],
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //         child: Text(
              //           'Or continue with',
              //           style: TextStyle(color: Colors.white),
              //         ),
              //       ),
              //       Expanded(
              //         child: Divider(
              //           thickness: 0.6,
              //           color: Colors.grey[400],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 25),
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     // google button
              //     GoogleSignIn(imagePath: 'assets/images/google_logo.jpeg'),
              //   ],
              // ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              if(await login()) {
                setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => const NavScreen(),
                ),
              );});
              }
            },
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(1),
              backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.pink[300]!.withOpacity(0.8)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            child: SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Log in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Roboto-Medium',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                )
            ),
          ),
              const SizedBox(height: 35),
              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account yet?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                 TextButton(
                  onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                   }, child:  Text('Register now', style: TextStyle(
                  color: Colors.pink[300]?.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                ),),
                ),
                ],
              ),
              const SizedBox(height: 15),
              if (authError != "")
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      authError,
                      style: TextStyle(
                          fontFamily: 'Roboto-Medium',
                          fontSize: 16,
                          color: Colors.red[700]
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}