import 'package:flutter/material.dart';

class LocationSearchBar extends StatefulWidget {
  const LocationSearchBar({super.key});

  @override
  State<LocationSearchBar> createState() => _LocationSearchBarState();
}

class _LocationSearchBarState extends State<LocationSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(right: 25),
          child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  elevation: const MaterialStatePropertyAll<double>(1.0),
                  hintText: "Search locations",
                  hintStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(
                      fontFamily: 'Roboto-Medium',
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  side: MaterialStateProperty.all(BorderSide(color: Colors.pink[100]!.withOpacity(0.7), width: 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    )
                  ),
                  controller: controller,
                  leading: const Icon(Icons.search),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.pink[100]!),
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
