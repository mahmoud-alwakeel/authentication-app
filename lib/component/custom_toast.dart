// toast_utils.dart

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void customShowToast({
  required String message,
  Color backgroundColor = Colors.deepPurple,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    backgroundColor: backgroundColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
