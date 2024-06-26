import 'package:buzz_me/components/cancellation_toast.dart';
import 'package:buzz_me/components/upcoming_notification.dart';
import 'package:flutter/material.dart';

import '../screens/nav_screen.dart';

class CancellationModal extends StatefulWidget {
  const CancellationModal({super.key});

  @override
  State<CancellationModal> createState() => _CancellationModalState();
}

class _CancellationModalState extends State<CancellationModal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Container(
            width: MediaQuery.of(context).size.width ,
            decoration: BoxDecoration(
              color: Colors.green[100]?.withOpacity(0.8),
              border: Border.all(
                color: Colors.green.shade100,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
             child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 0, bottom: 10),
                  child: Text(
                    'Cancel this notification?',
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontFamily: 'Roboto-Medium',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only( left: 25, bottom: 10),
                  child: Text(
                    'Are you sure you want to delete this notification?',
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontFamily: 'Roboto-light',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                    children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(const Size(5, 30)),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade100.withOpacity(0.1)),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            elevation: MaterialStateProperty.resolveWith<double>((states) {
                              return 0.0;
                            }),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontFamily: 'Roboto-Medium',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                      ),
                       const Spacer(),
                       ElevatedButton(
                        onPressed: () {
                          CancellationToast.showCancellationToast(context);
                          setState(() {
                            UpcomingNotification.time.removeAt(UpcomingNotification.index);
                          });
                          Navigator.pop(context);
                          Navigator.pushReplacement(context, PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) => const NavScreen(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade100.withOpacity(0.1)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          elevation: MaterialStateProperty.resolveWith<double>((states) {
                            return 0.0;
                          }),
                        ),
                        child: Text(
                          'Delete',
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
              ],
            ),
          ),
        ],
      );
  }
}