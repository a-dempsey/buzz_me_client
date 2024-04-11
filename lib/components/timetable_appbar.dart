import 'package:buzz_me/screens/nav_screen.dart';
import 'package:flutter/material.dart';

class TimetableAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TimetableAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.pink[100]!.withOpacity(0.6),
      elevation: 0,
      toolbarHeight: 85,

      automaticallyImplyLeading: false,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2),
          child: Text(
            "Timetable",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto-Medium',
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 25);
}