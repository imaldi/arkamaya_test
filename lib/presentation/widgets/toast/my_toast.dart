import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

myToast(String message, {Toast? toastLength}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength ?? Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.teal,
      textColor: Colors.white,
      fontSize: 16.0);
}
