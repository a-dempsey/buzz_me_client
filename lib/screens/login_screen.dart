import 'package:buzz_me/screens/register_screen.dart';
import 'package:flutter/material.dart';

import '../components/edit_textfield.dart';
import '../components/icon.dart';
import '../components/google_sign_in.dart';
import '../components/log_in_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration:  BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.cyan.shade800, Colors.grey.shade300],
          stops: const [0.1, 0.9],
          ),
          ),

          child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // icon display
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // image
                  IconImage(imagePath: 'assets/images/bus_icon.png'),
                ],
              ),

              const SizedBox(height:40),
              // heading
              Text(
                'Buzz Me!',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 40,
                  fontFamily: 'Limelight',
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 25),
              // desc
              Text(
                'UCC Shuttle Bus Services',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                  fontFamily: 'Roboto-Regular',

                ),
              ),

              const SizedBox(height: 40),
              // username textfield
              EditText(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              EditText(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 15),

              // forgot password?
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.cyan.shade900,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              LogInButton(
                onTap: signIn,
              ),

              const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.6,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.6,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // google sign in
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  // google button
                  GoogleSignIn(imagePath: 'assets/images/google_logo.jpeg'),

                ],
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

              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/register_screen');
                },
                child: const Text(
                  'Register now',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),

                ),
              )
                ],
              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}