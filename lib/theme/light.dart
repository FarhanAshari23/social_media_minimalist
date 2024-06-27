import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  dividerTheme: const DividerThemeData(color: Colors.transparent),
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color(0xffF9F5F6),
    primary: Color(0xffF8E8EE),
    secondary: Color(0xffFDCEDF),
    inversePrimary: Color(0xff254336),
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: const Color(0xffC6EBC5),
        displayColor: const Color(0xffFEFDED),
      ),
);
