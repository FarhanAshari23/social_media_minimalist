import 'package:flutter/material.dart';

ThemeData darkmode = ThemeData(
  dividerTheme: const DividerThemeData(color: Colors.transparent),
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color(0xff222831),
    primary: Color(0xff31363F),
    secondary: Color(0xff76ABAE),
    inversePrimary: Color(0xffEEEEEE),
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: const Color(0xffC6EBC5),
        displayColor: Colors.white,
      ),
);
