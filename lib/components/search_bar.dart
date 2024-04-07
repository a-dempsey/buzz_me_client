import 'package:buzz_me/components/available_routes.dart';
import 'package:buzz_me/stops/bus_stops.dart';
import 'package:flutter/material.dart';

import '../routes/get_routes.dart';
import '../screens/timetable_screen.dart';
import '../stops/get_stops.dart';
import 'dropdown_menu.dart';

class LocationSearchBar extends StatefulWidget {
  const LocationSearchBar({super.key});
  static String currentKey = "";

  @override
  State<LocationSearchBar> createState() => _LocationSearchBarState();
}

class _LocationSearchBarState extends State<LocationSearchBar> {
  static bool hasText = false;
  TextEditingController locationTextController = TextEditingController();
  OverlayEntry? locationContainer;
  List<String> locations = [];

  @override
  void initState(){
    super.initState();
    getRoutes(
      onFailureCallback: () {
        print("ERR: didn'/t get stops");
      },
      onSuccessCallback: (Map<String, List<dynamic>> routesList, timeList) {
        for (var stop in routesList.keys) {
          locations.add(stop);
        }},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 25),
        child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              elevation: const MaterialStatePropertyAll<double>(1.0),
              hintText: LocationSearchBar.currentKey == "" ? "Search locations" : LocationSearchBar.currentKey,
              hintStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(
                  fontFamily: 'Roboto-Medium',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              side: MaterialStateProperty.all(
                BorderSide(
                  color: Colors.pink[100]!.withOpacity(0.7),
                  width: 1,
                ),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              controller: locationTextController,
              leading: const Icon(Icons.search),
              trailing: hasText ? [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      hasText = false;
                      locationTextController.clear();
                      locationContainer?.remove();
                      locationContainer = null;
                    });
                  },
                ),
              ] : null,
              backgroundColor: MaterialStateProperty.all<Color>(Colors.pink[50]!),
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onTap: () {},
              onChanged: (locationText) {
                setState(() {
                  hasText = locationText.isNotEmpty;
                  List<String> results = [];
                  if (locationText.isNotEmpty) {
                    for (var stop in locations) {
                      if (stop.toLowerCase().contains(locationText.toLowerCase())) {
                        results.add(stop);
                      }
                    }
                  }
                  if (results.isNotEmpty) {
                    locationContainer?.remove();
                    locationContainer = OverlayEntry(
                      builder: (BuildContext overlayContext) => Positioned(
                        top: MediaQuery.of(context).size.height * 0.32,
                        left: 10.0,
                        right: 20.0,
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Column(
                              children: [
                                for (var stop in results)
                                  ListTile(
                                    title: Text(stop),
                                    onTap: () {
                                      locationTextController.text = stop.toString();
                                      locationContainer?.remove();
                                      locationContainer = null;
                                      FocusScope.of(context).unfocus();
                                      LocationSearchBar.currentKey = stop;
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) => Overlay.of(context).insert(locationContainer!)
                    );
                    } else {
                      locationContainer?.remove();
                      locationContainer = null;
                    }
                });
              },
            );
          },
          suggestionsBuilder: (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(5, (_) {
              return ListTile(
                onTap: () {
                },
              );
            });
          },
        ),
      ),
    );
  }
}