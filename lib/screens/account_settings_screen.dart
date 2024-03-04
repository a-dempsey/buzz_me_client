import 'package:buzz_me/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading:  IconButton(icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.pink[100]!.withOpacity(0.6),
        toolbarHeight: 65,
        title: const Text(
          'Account',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto-Medium',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          children: [
            const SizedBox(height: 20),
             Padding(
              padding: const EdgeInsets.only(left: 8),
              child: InkWell(
                onTap: () => {
                  logOut(),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  )
                },
                child: const Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    SizedBox(width: 30),
                    Text(
                      "Log out",
                      style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Roboto-Medium',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]
                ),
              ),
            ),
            Divider(
              height: 10,
              thickness: 1,
              endIndent: 10,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}