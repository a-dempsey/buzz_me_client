import 'package:flutter/material.dart';

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

  static const List<Widget> _widgetOptions = <Widget>[
    Text(''),
    Text(''),
    Text(''),
    Text(''),
    Text(''),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            _widgetOptions.elementAt(_selectedIndex),
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
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: _selectedIndex == 2 ? Colors.black : Colors.transparent,
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
    );
  }
}