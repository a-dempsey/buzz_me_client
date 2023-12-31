import 'dart:ui';

import 'package:flutter/material.dart';

class LocationSearchBar extends StatefulWidget {
  const LocationSearchBar({Key? key}) : super(key: key);

  @override
  State<LocationSearchBar> createState() => _LocationSearchBarState();
}

class _LocationSearchBarState extends State<LocationSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 56.0),
          child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  elevation: const MaterialStatePropertyAll<double>(
                    2.0),
                  hintText: "Search locations",
                  hintStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(
                      fontFamily: 'Roboto-Medium',
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  side: MaterialStateProperty.all(BorderSide(color: Colors.cyan[700]!, width: 2.5)),
                  controller: controller,
                  leading: const Icon(Icons.search),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan[50]!),
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  onTap: () {
                   // TODO define search behaviour
                  },
                  onChanged: (_) {
                  },
                );
              }, suggestionsBuilder:
              (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(5, (_) {
              return ListTile(
                onTap: () {
                },
              );
            });
          }),
        ),
    );
  }
}
