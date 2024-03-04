import 'package:flutter/material.dart';

abstract class AppColors {
  static const redAccent = Colors.redAccent;
  static const blackColor = Colors.black;
  static const grey = Color(0xFF929292);
  static const white = Color(0xFFffffff);
  // static const lightpurple = Color(0xFFDADBF8);
}

class MyTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    // colorScheme: const ColorScheme.light(),
  );
}
