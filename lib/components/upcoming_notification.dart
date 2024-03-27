import 'package:flutter/material.dart';

import 'cancellation_modal.dart';

class UpcomingNotification extends StatefulWidget {
  static List<String> time = [];
  static List<String> destination = [];
  static bool display = true;

  const UpcomingNotification({super.key});
  @override
  State<UpcomingNotification> createState() => _UpcomingNotificationState();
}

class _UpcomingNotificationState extends State<UpcomingNotification> {
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
              if(UpcomingNotification.display == true && UpcomingNotification.time.isNotEmpty)
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
                                      left: 12, right: 70),
                                  child: Text(
                                    //TODO: fill in w server shit
                                    UpcomingNotification.time[i],
                                    style: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontFamily: 'Roboto-Medium',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Text(
                                  //TODO: fill in w server shit
                                  UpcomingNotification.destination[i],
                                  style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontFamily: 'Roboto-Medium',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
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
             if(UpcomingNotification.display == false | UpcomingNotification.time.isEmpty)
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
