import 'package:buzz_me/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/edit_textfield.dart';
import '../components/icon.dart';
import 'nav_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String authError = '';

  Future<bool> createAccount() async {
    String err = "";
    try {

      if (passwordController.text.trim() == confirmPasswordController.text.trim()){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text.trim(),
          password: passwordController.text.trim(),
        );
        return true;
      } else {
        setState(() {
          authError = 'Passwords do not match';
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        err = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        err = 'The account already exists for that email.';
      }
      setState(() {
        authError = err;
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
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 2),
                const IconImage(imagePath: 'assets/images/bus_icon.png', width: 80, height: 60),
                const SizedBox(height: 30),
                const Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'Roboto-Medium',
                  ),
                ),
                const SizedBox(height: 10),
                // desc
                const Text(
                  'Register with your UCC email address',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Roboto-Regular',
                  ),
                ),
                const SizedBox(height: 40),
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
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                EditText(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 70),
                ElevatedButton(
                  onPressed: () async {
                    if(await createAccount()){
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavScreen(),
                          ),
                        );
                      },);
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
                            'Register',
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
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                      },
                      child:  Text(
                        'Log in',
                        style: TextStyle(
                          color: Colors.pink[300]!.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
            )
          )
        ),
      ),
    );
  }
}