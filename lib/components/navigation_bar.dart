import 'package:flutter/material.dart';
import 'package:buzz_me/screens/home_screen.dart';
import 'package:buzz_me/screens/map_screen.dart';
import 'package:buzz_me/screens/timetable_screen.dart';

import '../screens/nav_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  static int selectedIndex = 1;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late PageController _pageController;
  static const List<Widget> _routes = [
    MapScreen(),
    HomeScreen(),
    TimetableScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      BottomNavBar.selectedIndex = index;
      Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const NavScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),);
      NavScreen.index = BottomNavBar.selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:  Icon(Icons.fmd_good_outlined, size: BottomNavBar.selectedIndex == 0 ? 24 : 22),
            label: BottomNavBar.selectedIndex == 0 ? 'Map' : '',
          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.home, size: BottomNavBar.selectedIndex == 1 ? 24 : 22),
            label: BottomNavBar.selectedIndex == 1 ? 'Home' : '',
          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.article, size: BottomNavBar.selectedIndex == 2 ? 24 : 22),
            label: BottomNavBar.selectedIndex == 2 ? 'Timetable' : '',
          ),
        ],
        currentIndex: BottomNavBar.selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[500],
        onTap: _onItemTapped,
      ),

      body: Stack(
        children: [
          Positioned(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onItemTapped,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _routes[BottomNavBar.selectedIndex],
              ],
            ),
          ),
          AnimatedPositioned(
            top: 825,
            left: BottomNavBar.selectedIndex == 0 ? 22 : BottomNavBar.selectedIndex == 2 ? (164.00 * BottomNavBar.selectedIndex) - 20 : 164.00 * BottomNavBar.selectedIndex, duration: const Duration(
            milliseconds: 250,
          ),
            child: Container(
              width: 100,
              height: 6,
              decoration: BoxDecoration(
              color: Colors.pink[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}