import 'package:buzz_me/components/dropdown_menu.dart';
import 'package:buzz_me/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/nearest_routes.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  bool isAvailable = false;
  bool showRoutes = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.pink[100]!.withOpacity(0.6),
      //   // toolbarHeight: 65,
      //   // title: const Text(
      //   //   'Timetable',
      //   //   style: TextStyle(
      //   //     color: Colors.black,
      //   //     fontFamily: 'Roboto-Medium',
      //   //     fontSize: 20,
      //   //     fontWeight: FontWeight.w500,
      //   //   ),
      //   // ),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  const Text(
                  'Access route information',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto-Medium',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2.5),
                Text(
                  'Search by stop name',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontFamily: 'Roboto-Medium',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 13.5),
                const SizedBox(
                  height: 50,
                  child: LocationSearchBar()
                ),
                const SizedBox(height: 13.5),
                const SizedBox(
                    height: 50,
                    child: RouteDropdown()
                ),
               const SizedBox(height: 13.5),
                SizedBox(
                  height: 50,
                  width: 120,
                  child: FloatingActionButton(
                    elevation: 1,
                    backgroundColor: Colors.pink[300]!.withOpacity(0.8),
                    shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: Colors.pink[100]!.withOpacity(0.7),),borderRadius: BorderRadius.circular(16)),
                    onPressed: () {
                      setState(() {
                        // TODO: change to match w names
                        isAvailable = !isAvailable;
                        showRoutes = true;
                    },);},
                    child: const Text(
                    'Search',
                    style: TextStyle(
                      fontFamily: 'Roboto-Medium',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                if(showRoutes)
                  const Text(
                    'Available routes',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto-Medium',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                const SizedBox(height: 13.5),
                if(!isAvailable)
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'There are no routes available at this time',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto-Medium',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
               //
                if(isAvailable)
                  Material(
                    elevation: 1,
                    shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))
                  ),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 22,
                      padding: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.pink[100]?.withOpacity(0.2),
                        border: Border.all(
                          color: Colors.red.shade100,
                      ),
                      borderRadius: const BorderRadius.all(Radius
                          .circular(16)),
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          NearestRoutes(),
                        ],
                      ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
