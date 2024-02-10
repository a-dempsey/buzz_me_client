import 'package:flutter/material.dart';

class RouteDropdown extends StatefulWidget {
  const RouteDropdown({super.key});

  @override
  State<RouteDropdown> createState() => _RouteDropdownState();
}

class _RouteDropdownState extends State<RouteDropdown> {
  static const List<String> list = <String>['-- unselect route --', 'route one', 'route 2', 'route 3'];
  String dropdownValue = list.first;
  bool selected = false;
  bool opened = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
        child: Container(
          width: MediaQuery.of(context).size.width - 50,
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
                       selected && dropdownValue != '-- unselect route --' ? dropdownValue : "Select a route",
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
                    child: SizedBox(width: MediaQuery.of(context).size.width ,
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
                },
              )
            ),
          ),
      ),
    );
  }
}
