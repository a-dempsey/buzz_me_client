import 'dart:async';

import 'package:buzz_me/components/confirmation_toast.dart';
import 'package:buzz_me/components/upcoming_notification.dart';
import 'package:buzz_me/screens/timetable_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';
import '../notifications/notifications.dart';
import '../screens/nav_screen.dart';
import 'nearest_routes.dart';
import 'package:intl/intl.dart';
import 'package:hotreloader/hotreloader.dart';

class SelectionModal extends StatefulWidget {
  static String from = "";
  static String time = "";
  const SelectionModal({super.key});
  @override
  State<SelectionModal> createState() => _SelectionModalState();
}

class _SelectionModalState extends State<SelectionModal> {
 // static DateTime _mins = DateTime(0);
  int _mins = 0;
  bool showNotification = false;
  bool delivered = false;
  bool check = false;
  Timer? _notificationTimer;

  bool _notificationDelivered = false;
  int len = 0;
  int counter = 0;

  // Future<void> _setNotification(int hour, int minute) async {
  //   final deliverNotification = DateTime(hour, minute).difference(DateTime.now());
  //
  //   Timer.periodic(deliverNotification, (Timer timer) async {
  //     if (hour == DateTime.now().hour && minute == DateTime.now().minute) {
  //       final localNotificationService = LocalNotificationService();
  //       await localNotificationService.showLocalNotification(
  //         'Buzz Me',
  //         'Your bus is due to arrive in ${_mins.minute} minutes',
  //       );
  //       timer.cancel();
  //       delivered = true;
  //     }
  //   });
  // }


  bool _notificationInProgress = false;

  Future<void> _setNotification(int hour, int minute) async {
    final now = DateTime.now();
    final scheduledTime = DateTime(now.year, now.month, now.day, hour, minute);

    final delay = scheduledTime.difference(now);
    if (delay.isNegative) {
      // If the scheduled time is in the past, don't schedule the notification
      return;
    }

    _notificationInProgress = true;

    _notificationTimer = Timer(delay, () async {
      final localNotificationService = LocalNotificationService();
      await localNotificationService.showLocalNotification(
        'Buzz Me',
        'Your bus is due to arrive in ${_mins} minutes',
      );
      _notificationTimer?.cancel();
      print(UpcomingNotification.index);
      _removeNotification(UpcomingNotification.index);
      _notificationInProgress = false; // Notification task completed
    });
  }
  //
  // void _cancelNotificationTimer() {
  //   _notificationTimer?.cancel();
    // setState(() {
    //   UpcomingNotification.time.removeAt(UpcomingNotification.index);
    // });
    // Navigator.pushReplacement(context, PageRouteBuilder(
    //        pageBuilder: (context, animation1, animation2) => const NavScreen(),
    //        transitionDuration: Duration.zero,
    //        reverseTransitionDuration: Duration.zero,
    //      ),);

    //_checkDelivered();
  // }

  // @override
  // void dispose() {
  //   if (_notificationInProgress) {
  //     _checkDelivered();
  //     print("yargh");
  //     // Wait for notification task to complete before disposing
  //    // WidgetsBinding.instance!.addPostFrameCallback((_) => dispose()); // Try again after a frame
  //     return;
  //   }
  //   print("NAR");
  //   _cancelNotificationTimer(); // Cancel the timer when the widget is disposed
  //   super.dispose(); // Call super.dispose() to release resources
  // }
  //
  // Future<void> _checkDelivered() async {
  //
  //   while(_notificationInProgress == true){
  //     await Future.delayed(const Duration(seconds: 1));
  //   }
  //   if(_notificationInProgress == false) {
  //     _removeNotification();
  //   }
  //
  // }
  //
  // Future<void> _removeNotification() async {
  //   //if(!mounted){return;}
  //   if(UpcomingNotification.time.isNotEmpty) {
  //     print("a");
  //     setState(() {
  //       UpcomingNotification.time.removeAt(UpcomingNotification.index);
  //     });
  //
  //      //  Navigator.pushReplacement(context, PageRouteBuilder(
  //      //    pageBuilder: (context, animation1, animation2) => const NavScreen(),
  //      //    transitionDuration: Duration.zero,
  //      //    reverseTransitionDuration: Duration.zero,
  //      //  ),);
  //
  //   }
  //   print("c");
  //
  //   delivered = false;
  // }
  @override
  Future<void> dispose() async {
    while (_notificationInProgress) {
      await Future.delayed(const Duration(seconds: 1));
    }
    //_notificationTimer?.cancel();
    super.dispose();
  }

  Future<void> _removeNotification(int index) async {
    if (mounted) {
      setState(() {
        UpcomingNotification.time.removeAt(index);
      });
    }
  }


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
            color: Colors.green[100]?.withOpacity(0.8),
            border: Border.all(
              color: Colors.green.shade100,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 0, bottom: 8),
                child: Text(
                  'Set notification?',
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontFamily: 'Roboto-Medium',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 12),
                child: Text(
                  'How soon before the bus arrives would you like to be notified?',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontFamily: 'Roboto-light',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: TextField(
                    decoration: const InputDecoration(border: InputBorder.none,icon: Icon(Icons.access_time_rounded), hintText: '00'),
                    keyboardType: TextInputType.number,
                    onChanged: (String value){
                      _mins = int.parse(value);
                    },
                    inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              // TimePickerSpinnerPopUp(
              //   mode: CupertinoDatePickerMode.time,
              //   initTime: DateTime.parse("0000-00-00 00:00:00"),
              //   maxTime: DateTime(0).add(const Duration(hours: 0, minutes: 29)),
              //   timeFormat: 'H:mm',
              //   onChange: (DateTime value) {
              //       _mins = value;
              //   },
              // ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(const Size(5, 30)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green.shade100.withOpacity(0.1)),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.black),
                      elevation: MaterialStateProperty.resolveWith<double>((
                          states) {
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
                    onPressed: () async {
                      Navigator.pop(context);
                      setState(() {
                        UpcomingNotification.display = true;
                       DateTime routeTime = DateFormat('HH:mm').parse(SelectionModal.time);
                       // DateTime routeTime = DateTime.thursday as DateTime;
                        final time = routeTime.subtract(Duration(minutes: _mins));
                        if(time.minute >= 0 && time.minute < 10) {
                          UpcomingNotification.time.add(("${time.hour}:0${time.minute}"));
                        } else if(time.hour >= 0 && time.hour < 10) {
                          UpcomingNotification.time.add(("0${time.hour}:${time.minute}"));
                        } else if((time.hour >= 0 && time.minute >= 0) && (time.hour < 10 && time.minute < 10)) {
                          UpcomingNotification.time.add(("0${time.hour}:0${time.minute}"));
                        }
                        else {
                          UpcomingNotification.time.add(("${time.hour}:${time.minute}"));
                        }
                        UpcomingNotification.time.sort();
                        UpcomingNotification.destination.add(SelectionModal.from);
                       // UpcomingNotification.index = UpcomingNotification.time.indexOf("${time.hour}:${time.minute}");
                        _setNotification(time.hour, time.minute);

                        // if(UpcomingNotification.time.isNotEmpty) {
                        //   _checkDelivered();
                        // }
                      });
                      Navigator.pushReplacement(context, PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) => const NavScreen(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),);
                      if(_mins >= 1) {
                        ConfirmationToast.showConfirmationToast("A notification has been set for ${_mins} minutes before \nthe bus arrives", context);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green.shade100.withOpacity(0.1)),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.black),
                      elevation: MaterialStateProperty.resolveWith<double>((
                          states) {
                        return 0.0;
                      }),
                    ),
                    child: Text(
                      'Confirm',
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
