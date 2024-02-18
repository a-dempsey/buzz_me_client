import 'package:buzz_me/components/selection_modal.dart';
import 'package:flutter/material.dart';

class NearestRoutes extends StatelessWidget {
  const NearestRoutes({super.key});

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
                        'F (T)',
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