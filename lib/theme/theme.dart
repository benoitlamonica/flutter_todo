library to_do.globals;

import 'package:flutter/material.dart';

Color mainColor = Color.fromRGBO(102, 64, 245, 1);
ThemeData main = ThemeData(
  primaryColor: mainColor,
  scaffoldBackgroundColor: mainColor,
  textButtonTheme:
      TextButtonThemeData(style: TextButton.styleFrom(primary: mainColor)),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.bold,
      color: mainColor,
    ),
    headline2: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: mainColor,
    ),
    headline3: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: mainColor,
    ),
    bodyText1: TextStyle(
      fontSize: 14.0,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
  ),
  fontFamily: 'Helvetica',
);
