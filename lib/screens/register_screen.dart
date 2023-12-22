import 'package:flutter/material.dart';

import '../components/edit_textfield.dart';
import '../components/register_button.dart';
import '../components/icon.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // create user account method
  void createAccount() {}

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
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                // icon display
                    // image
                const IconImage(imagePath: 'assets/images/bus_icon.png'),

                const SizedBox(height: 40),
                Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 40,
                    fontFamily: 'Roboto-Medium',
                    //fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 25),
                // desc
                Text(
                  'Register with your UCC email address',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontFamily: 'Roboto-Regular',
                   // fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),
                // username textfield
                EditText(
                  controller: usernameController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // username textfield
                EditText(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                // username textfield
                EditText(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: false,
                ),
                const SizedBox(height: 35),

                // sign in button
                RegisterButton(
                  onTap: createAccount,
                ),
              ],
            )
          )
        ),
      ),
    );
  }
}