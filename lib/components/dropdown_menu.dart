import 'package:buzz_me/components/search_bar.dart';
import 'package:buzz_me/routes/get_routes.dart';
import 'package:flutter/material.dart';

class RouteDropdown extends StatefulWidget {
  const RouteDropdown({super.key});
  static String selectedValue = "";

  @override
  State<RouteDropdown> createState() => _RouteDropdownState();
}

class _RouteDropdownState extends State<RouteDropdown> {
  static const List<String> list = <String>['-- unselect destination --', 'Pouladuff', 'Brookfield', 'UCC Main Campus', 'Lee Maltings'];
  String dropdownValue = "";
  bool selected = false;
  bool opened = false;

  @override
  void initState(){
    super.initState();
    // getRoutes(
    //   onFailureCallback: () {
    //     print("ERR: didn'/t get routes");
    //   },
    //   onSuccessCallback: (Map<String, List<dynamic>> routesList) {
    //     for (var route in routesList.values) {
    //       lista.add(route);
    //       print(lista);
    //       // print(LocationSearchBar.current);
    //     }
    //     for (var route in routesList.keys) {
    //       key.add(route);
    //     }},
    // );
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
        child: Container(
          width: MediaQuery.of(context).size.width - 37,
          decoration: BoxDecoration(
            color: Colors.pink[100]?.withOpacity(0.43),
            border: Border.all(
              color: Colors.red.shade100,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.5),
            child: DropdownButtonHideUnderline(
              child: PopupMenuButton<String>(
                offset: const Offset(0, 52),
                elevation: 0,
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        selected && RouteDropdown.selectedValue != '-- unselect destination --' ? RouteDropdown.selectedValue : (RouteDropdown.selectedValue != "" && RouteDropdown.selectedValue != '-- unselect destination --' ? RouteDropdown.selectedValue : "Select a destination"),
                        style: TextStyle(
                          fontFamily: 'Roboto-Medium',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Icon(opened ? Icons.arrow_drop_up : Icons.arrow_drop_down)
                  ],
                ),
              onSelected: (String value) {
                setState(() {
                  dropdownValue = value;
                  RouteDropdown.selectedValue = dropdownValue;
                  selected = true;
                  opened = false;
                });
              },
              onOpened: () {
                  setState(() {
                    opened = true;
                  });
              },
                onCanceled: (){
                  setState(() {
                    opened = false;
                  });
                },
              itemBuilder: (BuildContext context) {
                return list.map<PopupMenuItem<String>>((String value) {
                  return PopupMenuItem<String>(
                    value: value,
                    child: SizedBox(width: MediaQuery
                        .of(context)
                        .size
                        .width,
                      child: Text(
                        value,
                        style: TextStyle(
                            fontFamily: 'Roboto-Medium',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[700]
                        ),
                      ),
                    ),
                  );
                }).toList();
              }
              )
            ),
          ),
      ),
    );
  }
}
