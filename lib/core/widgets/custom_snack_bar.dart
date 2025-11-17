import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    super.key,
    required String message,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
  }) : super(
         content: Text(message, style: TextStyle(color: textColor)),
         backgroundColor: backgroundColor,
         behavior: SnackBarBehavior.floating,
         margin: const EdgeInsets.all(16),
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
         duration: const Duration(seconds: 3),
       );
}
