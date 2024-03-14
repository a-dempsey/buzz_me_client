import 'package:flutter/material.dart';
import 'package:buzz_me/screens/discover_routes.dart';
//import 'package:buzz_me/screens/nearest_routes.dart';
import 'package:buzz_me/screens/saved_routes.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  HomeMenuState createState() => HomeMenuState();
}

class HomeMenuState extends State<HomeMenu> with SingleTickerProviderStateMixin {
  late TabController _controller;
  final List<String> titleList = ["Discover Routes", "Nearest Routes", "Saved Routes"];
  late String currentTitle;

  @override
  void initState() {
    currentTitle = titleList[0];
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(changeTitle);
    super.initState();
  }

  void changeTitle() {
    setState(() {
      currentTitle = titleList[_controller.index];
    });
  }

  static const List<Widget> _menutabs = [
    DiscoverRoutes(),
    //NearestRoutes(),
    SavedRoutes(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _menutabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          titleSpacing: 75,
          title: Text(currentTitle, style: const TextStyle(fontFamily: 'Roboto-Medium', fontSize: 26)),
          bottom: TabBar(
            isScrollable: true,
            labelPadding: const EdgeInsets.symmetric(horizontal: 25.0),
            indicatorColor: Colors.cyan[800],
            labelColor: Colors.cyan[800],
            unselectedLabelColor: Colors.grey[900],
            labelStyle: const TextStyle(fontSize: 16,fontFamily: 'Roboto-Medium'),
            unselectedLabelStyle: const TextStyle(fontSize: 16,fontFamily: 'Roboto-Medium'),
            controller: _controller,
            tabs: const [
              Tab(text: 'Discover'),
              Tab(text: 'Nearest'),
              Tab(text: 'Saved'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: _menutabs,
        ),
      ),
    );
  }
}