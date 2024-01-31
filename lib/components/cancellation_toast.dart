import 'package:flutter/material.dart';

class CancellationToast{
  static showCancellationToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
              'This notification has been deleted',
              style: TextStyle(
                color: Colors.grey.shade800,
                fontFamily: 'Roboto-Medium',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),),
            ),
          ],
        ),
        backgroundColor: Colors.red[200]?.withOpacity(0.8),
        margin: EdgeInsets.only(left: 45, right: 45, bottom: MediaQuery.of(context).size.height * 0.1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ),
    );
  }
}
