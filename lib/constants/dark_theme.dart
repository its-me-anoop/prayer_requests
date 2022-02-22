import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.amber[900],
    backgroundColor: Colors.black,
    cardColor: Colors.blueGrey,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.amber[900],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)))),
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)));
