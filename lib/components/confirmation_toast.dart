import 'package:flutter/material.dart';

class ConfirmationToast{
  static showConfirmationToast(String str, BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const SizedBox(width: 12),
            Text(
                str,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontFamily: 'Roboto-Medium',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
            ),
          ],
        ),
        backgroundColor: Colors.green[100]?.withOpacity(0.8),
        margin: EdgeInsets.only(left: 15, right: 15, bottom: MediaQuery.of(context).size.height * 0.1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ),
    );
  }
}
