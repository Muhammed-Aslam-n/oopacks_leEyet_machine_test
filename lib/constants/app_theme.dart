
import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightPrimaryColor = Color(0xFF40426D);
  static const Color lightSecondaryColor = Color(0xFFEFC083);

  static const Color darkPrimaryColor = Colors.black;
  static const Color darkSecondaryColor = Color(0xffe7eae7);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    cardColor: Colors.white,
    highlightColor: lightPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: lightPrimaryColor,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      // Your text styles for the light theme
    ),switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(lightSecondaryColor),trackColor: MaterialStateProperty.all(lightSecondaryColor)
  ),
    colorScheme: const ColorScheme.light(
        primary: lightPrimaryColor,
        secondary: lightSecondaryColor,
        background: Colors.white,tertiary: lightSecondaryColor
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    highlightColor: Colors.white,
    cardColor: Colors.black,
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkPrimaryColor,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(

    ),switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.cyan)
      ,trackColor: MaterialStateProperty.all(Colors.grey)
  ),
    colorScheme: const ColorScheme.dark(
      primary: darkPrimaryColor,
      secondary: darkSecondaryColor,
      background: Colors.black,tertiary: Colors.white,
    ),
  );
}
