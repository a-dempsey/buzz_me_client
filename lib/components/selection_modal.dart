import 'dart:async';
import 'package:buzz_me/components/confirmation_toast.dart';
import 'package:buzz_me/components/upcoming_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/nav_screen.dart';
import 'package:intl/intl.dart';


class SelectionModal extends StatefulWidget {
  static String from = "";
  static String time = "";
  static int mins = 0;

  const SelectionModal({super.key});
  @override
  State<SelectionModal> createState() => _SelectionModalState();
}

class _SelectionModalState extends State<SelectionModal> {
  Future<void> setTime(int hour, int minute) async{
    UpcomingNotification.hour = hour;
    UpcomingNotification.minute = minute;
  }

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
                      SelectionModal.mins = int.parse(value);
                    },
                    inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
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
                        List<String> upcomingTime = UpcomingNotification.time;
                        List<String> upcomingDest = UpcomingNotification.destination;
                        DateTime routeTime = DateFormat('HH:mm').parse(SelectionModal.time);
                        final time = routeTime.add(Duration(minutes: SelectionModal.mins));
                        if(time.minute >= 0 && time.minute < 10) {
                          upcomingTime.add(("${time.hour}:0${time.minute}"));
                        } else if(time.hour >= 0 && time.hour < 10) {
                          upcomingTime.add(("0${time.hour}:${time.minute}"));
                        } else if((time.hour >= 0 && time.minute >= 0) && (time.hour < 10 && time.minute < 10)) {
                          upcomingTime.add(("0${time.hour}:0${time.minute}"));
                        }
                        else {
                          upcomingTime.add(("${time.hour}:${time.minute}"));
                        }
                        upcomingTime.sort();
                        upcomingDest.add(SelectionModal.from);
                        UpcomingNotification.index = UpcomingNotification.time.indexOf("${time.hour}:${time.minute}");
                        setTime(time.hour, time.minute);
                      });

                      Navigator.pushReplacement(context, PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) => const NavScreen(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),);
                      if(SelectionModal.mins >= 1) {
                        ConfirmationToast.showConfirmationToast("A notification has been set for ${SelectionModal.mins} minutes before \nthe bus arrives", context);
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


