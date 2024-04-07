import 'package:buzz_me/components/display_map_routes.dart';
import 'package:buzz_me/screens/map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../screens/timetable_screen.dart';
import 'available_routes.dart';

class DisplayRoutesModal extends StatefulWidget {
  const DisplayRoutesModal({super.key});
  @override
  State<DisplayRoutesModal> createState() => _DisplayRoutesModalState();
}

class _DisplayRoutesModalState extends State<DisplayRoutesModal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
            color: Colors.green[50]?.withOpacity(0.8),
            border: Border.all(
              color: Colors.green.shade100,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
          ),
          child: Column(
            children: [
              Row(
                children: [IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Text(
                        'Routes at: ${MapScreen.selected}',
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontFamily: 'Roboto-Medium',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      ),],
                  ),),
                ]
              ),
              Divider(
                height: 0,
                thickness: 1,
                endIndent: 0,
                color: Colors.grey[500],
              ),
              Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 22),
                        child: DisplayMapRoutes(to: MapScreen.dest, time: MapScreen.time),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
