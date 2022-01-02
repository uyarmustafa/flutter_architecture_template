import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/constants/color/color_constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastServiceType { Info, Danger, Warning, Success }

class ToastService {
  static show(String message, ToastServiceType type) {
    var color;

    if (type == ToastServiceType.Danger) color = redColor;
    if (type == ToastServiceType.Info) color = blueColor;
    if (type == ToastServiceType.Warning) color = yellowColor;
    if (type == ToastServiceType.Success) color = greenColor;

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
