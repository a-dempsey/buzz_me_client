import 'package:buzz_me/components/search_bar.dart';
import 'package:buzz_me/components/selection_modal.dart';
import 'package:buzz_me/screens/timetable_screen.dart';
import 'package:flutter/material.dart';

class AvailableRoutes extends StatelessWidget {
  final String to;
  final String time;
  const AvailableRoutes({super.key, required this.to, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            children: [
              Material(
                elevation: 1,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Container(
                  width: MediaQuery.of(context).size.width - 52,
                  height: 55.0,
                  decoration: BoxDecoration(
                    color: Colors.pink[100]!.withOpacity(0.6),
                    border: Border.all(
                      color: Colors.red.shade100,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 35),
                        child: Text(
                          SelectionModal.time,
                          style: TextStyle(
                            color: Colors.grey.shade900,
                            fontFamily: 'Roboto-Medium',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    SizedBox(width: 180,
                      child: Text(
                        "${LocationSearchBar.currentKey} -> ${TimetableScreen.dest}",
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontFamily: 'Roboto-Medium',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const Dialog(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    SelectionModal(),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(const Size(5, 30)),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.pink[100]!.withOpacity(0.1)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          elevation: MaterialStateProperty.resolveWith<double>((states) {
                            return 0.0;
                          }),
                        ),
                        child: Text(
                          'Select',
                          style: TextStyle(
                            color: Colors.red.shade900,
                            fontFamily: 'Roboto-Medium',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}