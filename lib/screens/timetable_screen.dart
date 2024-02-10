import 'package:buzz_me/components/dropdown_menu.dart';
import 'package:buzz_me/components/search_bar.dart';
import 'package:flutter/material.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
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

                  // SizedBox(height: 15),
                  // FloatingActionButton(
                  //   //child: Icon(Icons.person),
                  //   backgroundColor: Color.fromRGBO(0, 131, 143, 1),
                  //   foregroundColor: Colors.white,
                  //   onPressed: null,

    //
    ],),

              ),
          ],
        ),
      ),
    );
  }
}
