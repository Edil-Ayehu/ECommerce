import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReusableFunctions {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static void showErrorDialog(ctx, String errorMessage) {
    showCupertinoDialog(
        context: ctx,
        barrierDismissible: true,
        builder: (_) => CupertinoAlertDialog(
              title: const Text("Error"),
              content: Text(errorMessage),
              actions: [
                CupertinoButton(
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: Color(0xFF750F21),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ));
  }

  static void showToastMessage(String message, Color bgColor) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: bgColor,
    );
  }
}
