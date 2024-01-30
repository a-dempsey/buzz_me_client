import 'package:flutter/material.dart';

import 'cancelation_toast.dart';

class UpcomingNotification extends StatefulWidget {
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
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 28,
                    height: 55.0,
                    decoration: BoxDecoration(
                        color: Colors.pink[100],
                        border: Border.all(
                          color: Colors.red.shade100,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(16))
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 115),
                           child: Text(
                            //TODO: fill in w server shit
                            '02:00',
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
                          'UCC',
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
                                        CancelationToast(),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(const Size(5, 30)),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.pink.shade100),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            elevation: MaterialStateProperty.resolveWith<double>((states) {
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
