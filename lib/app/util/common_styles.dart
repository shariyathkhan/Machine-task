import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CommonStyle {
  static TextStyle headingStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
  static const textFieldBorderDecoration = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.zero),
  );
  static const textFieldFocusBorderDecoration = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 1.0),
    borderRadius: BorderRadius.all(Radius.zero),
  );
  static const textFieldErrorBorderDecoration = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
    borderRadius: BorderRadius.all(Radius.zero),
  );

  static ButtonStyle textButtonStyle = TextButton.styleFrom(
    primary: const Color(0xFF222529),
    minimumSize: Size(Get.width, 50),
    side: const BorderSide(
      color: Color(0xFF222529),
      width: 1.5,
    ),
  );
}
