import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.teal[900],
    backgroundColor: Colors.amber,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.teal[900],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)))),
    scaffoldBackgroundColor: Colors.teal,
    textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)));
