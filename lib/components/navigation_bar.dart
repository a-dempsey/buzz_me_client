import 'package:flutter/material.dart';
import 'package:buzz_me/screens/home_screen.dart';
import 'package:buzz_me/screens/map_screen.dart';
import 'package:buzz_me/screens/search_screen.dart';
import 'package:buzz_me/screens/settings_screen.dart';
import 'package:buzz_me/screens/timetable_screen.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BottomNavBar();
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 2;
  late PageController _pageController;

  static const List<Widget> _routes = [
    SettingsScreen(),
    MapScreen(),
    HomeScreen(),
    TimetableScreen(),
    SearchScreen(),
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
        backgroundColor: _selectedIndex == 2 ? Colors.cyan[800] : Colors.transparent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fmd_good_outlined),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Timetable',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
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
          Positioned(
            top: 760,
            left: 80.00 * _selectedIndex,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 600),
              opacity: _selectedIndex == _selectedIndex ? 1 : 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 5,
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.cyan[800],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}