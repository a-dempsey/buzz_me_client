import 'package:flutter/material.dart';
import 'account_settings_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
        'Settings',
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
          Row(
            children: [
              Text(
                'General',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontFamily: 'Roboto-Medium',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 3, width: 12),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                const Icon(Icons.manage_accounts_outlined),
                const SizedBox(width: 30),
                const Text(
                  "Account",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto-Medium',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_outlined, size: 14),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountSettingsScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
            thickness: 1,
            endIndent: 10,
            color: Colors.grey[300],
          ),
            const SizedBox(height: 2, width: 12),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  const Icon(Icons.notifications_none_outlined),
                  const SizedBox(width: 30),
                  const Text(
                    "Notifications",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto-Medium',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_outlined, size: 14),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
              thickness: 1,
              endIndent: 10,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 2, width: 12),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  const Icon(Icons.wb_sunny_outlined),
                  const SizedBox(width: 30),
                  const Text(
                    "Appearance",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto-Medium',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_outlined, size: 14),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
              thickness: 1,
              endIndent: 10,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                'Preferences',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontFamily: 'Roboto-Medium',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),],
            ),
            const SizedBox(height: 2, width: 12),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined),
                  const SizedBox(width: 30),
                  const Text(
                    "Location management",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto-Medium',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_outlined, size: 14),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      );
                    },
                  ),
                ],
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