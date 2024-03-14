import 'package:flutter/material.dart';
import 'package:buzz_me/screens/home_screen.dart';
import 'package:buzz_me/screens/map_screen.dart';
import 'package:buzz_me/screens/timetable_screen.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 1;
  late PageController _pageController;

  static const List<Widget> _routes = [
    MapScreen(),
    HomeScreen(),
    TimetableScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
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
            icon:  Icon(Icons.fmd_good_outlined, size: _selectedIndex == 0 ? 24 : 22),
            label: _selectedIndex == 0 ? 'Map' : '',
          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.home, size: _selectedIndex == 1 ? 24 : 22),
            label: _selectedIndex == 1 ? 'Home' : '',
          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.article, size: _selectedIndex == 2 ? 24 : 22),
            label: _selectedIndex == 2 ? 'Timetable' : '',
          ),
        ],
        currentIndex: _selectedIndex,
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
                _routes[_selectedIndex],
              ],
            ),
          ),
          AnimatedPositioned(
            top: 763,
            left: _selectedIndex == 0 ? 22 : _selectedIndex == 2 ? (164.00 * _selectedIndex) - 20 : 164.00 * _selectedIndex, duration: const Duration(
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