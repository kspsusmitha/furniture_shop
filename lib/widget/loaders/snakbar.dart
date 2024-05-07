import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarLoader {
  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static warningSnackbar({required title, message = ""}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.grey,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(8),
        icon: Icon(
          Icons.warning,
          color: Colors.yellow,
        ));
  }

  static successSnackbar({required title, message = "", duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.blue,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: EdgeInsets.all(8),
        icon: Icon(
          Icons.warning,
          color: Colors.yellow,
        ));
  }

  static errorSnackbar({required title, message = "", duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.grey,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: EdgeInsets.all(8),
        icon: Icon(
          Icons.warning,
          color: Colors.yellow,
        ));
  }
}
