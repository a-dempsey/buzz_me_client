import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';


class SelectionModal extends StatelessWidget {
  const SelectionModal({super.key});

  static DateTime _mins = DateTime(0);



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
              TimePickerSpinnerPopUp(
                mode: CupertinoDatePickerMode.time,

                initTime: DateTime.parse("0000-00-00 00:00:00"),
                maxTime: DateTime(0).add(const Duration(minutes: 59)),
                timeFormat: 'H:mm',
                onChange: (DateTime value) {
                    _mins = value;
                },
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
                    onPressed: () {
                      // TODO: remove notification from subscription
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