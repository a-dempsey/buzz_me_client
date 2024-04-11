import 'dart:async';

import 'package:buzz_me/components/selection_modal.dart';
import 'package:flutter/material.dart';
import '../notifications/notifications.dart';
import '../screens/nav_screen.dart';
import 'cancellation_modal.dart';

class UpcomingNotification extends StatefulWidget {
  static List<String> time = [];
  static List<String> destination = [];
  static bool display = true;
  static int index = 0;
  static bool remove = false;
  static int hour = 0;
  static int minute = 0;

  const UpcomingNotification({super.key});
  @override
  State<UpcomingNotification> createState() => UpcomingNotificationState();
}
final GlobalKey<UpcomingNotificationState> upcomingNotificationStateKey = GlobalKey<UpcomingNotificationState>();
class UpcomingNotificationState extends State<UpcomingNotification> {
  bool showNotification = false;
  bool delivered = false;
  bool check = false;
  Timer? _notificationTimer;
  bool removed = false;
  int len = 0;
  int counter = 0;
  bool isMounted = false;
  List<DateTime> scheduledTime = [];
  List<Duration> delay = [];


  @override
  void initState(){
    super.initState();
    if(UpcomingNotification.hour != 0){
      getTime(UpcomingNotification.hour, UpcomingNotification.minute);
    }
  }

  Future<void> getTime(int h, int m) async {
    await UpcomingNotification.hour != 0;
    setNotification(h, m);
  }

  Future<void> setNotification(int hour , int minute) async {
    final now = DateTime.now();
    scheduledTime.add(DateTime(now.year, now.month, now.day, hour, minute));
    for(int i = 0; i < scheduledTime.length; i++){
      delay.add(scheduledTime[i].difference(now));
      print(delay);

      if (delay[i].isNegative) {
        delay[i] = -delay[i];
      }
      //Timer(const Duration(seconds: 5), (){});
      if(UpcomingNotification.time.isNotEmpty) {
        _notificationTimer = Timer(delay[0], () async {
          final localNotificationService = LocalNotificationService();
          await localNotificationService.showLocalNotification(
            'Buzz Me',
            'Your bus is due to arrive in ${SelectionModal.mins} minutes',
          );
         // if (mounted) {
            setState(() {
              removed = true;
              UpcomingNotification.time.removeAt(i);
              //delay.removeAt(0);
              Navigator.pushReplacement(context, PageRouteBuilder(
                pageBuilder: (context, animation1,
                    animation2) => const NavScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),);

              _notificationTimer?.cancel();
            });
          //}
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Subscriptions',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto-Medium',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'Upcoming Notifications',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontFamily: 'Roboto-Medium',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              if(removed == false && UpcomingNotification.time.isNotEmpty)
                for(int i = 0; i < UpcomingNotification.time.length; i ++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Material(
                          elevation: 1,
                          borderRadius: const BorderRadius.all(Radius.circular(16)),
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width - 28,
                            height: 55.0,
                            decoration: BoxDecoration(
                                color: Colors.pink[100]!.withOpacity(0.6),
                                border: Border.all(
                                  color: Colors.red.shade100,
                                ),
                                borderRadius: const BorderRadius.all(Radius
                                    .circular(16))
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 50),
                                  child: Text(
                                    UpcomingNotification.time[i],
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
                                    UpcomingNotification.destination[i],
                                    style: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontFamily: 'Roboto-Medium',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    UpcomingNotification.index = UpcomingNotification.time.indexOf(UpcomingNotification.time[i]);
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const Dialog(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              CancellationModal(),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(5, 30)),
                                    backgroundColor: MaterialStateProperty.all<
                                        Color>(Colors.pink[100]!.withOpacity(0.1)),
                                    foregroundColor: MaterialStateProperty.all<
                                        Color>(Colors.black),
                                    elevation: MaterialStateProperty.resolveWith<
                                        double>((states) {
                                      return 0.0;
                                    }),
                                  ),
                                  child:
                                  Text(
                                    'x',
                                    style: TextStyle(
                                      color: Colors.red.shade900,
                                      fontFamily: 'Roboto-Medium',
                                      fontSize: 22,
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
                  ),
              if(UpcomingNotification.display == false || UpcomingNotification.time.isEmpty ||  removed == true)
                Text(
                  "You don't have any upcoming notifications at this time",
                  style: TextStyle(
                    color: Colors.green.shade500,
                    fontFamily: 'Roboto-Medium',
                    fontSize: 15.5,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}