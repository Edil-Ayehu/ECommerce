import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData lightTheme = ThemeData(
  // Define the primary color for your app
  primaryColor: Colors.blue,

  // Define the brightness as dark
  brightness: Brightness.light,

  // Define the accent color
  hintColor: Colors.orange,

  // Define the background color for the entire app
  scaffoldBackgroundColor: Colors.grey.shade200,

  // Define the text theme
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      color: Colors.black,
    ),
    labelLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),

  // Define the app bar theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    ),
  ),

  // Define the card theme
  cardTheme: const CardTheme(
    color: Color(0xFF1E1E1E),
    elevation: 2,
  ),

  // Define button themes
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     foregroundColor: Colors.white, backgroundColor: Colors.blue, // Button text color
  //     elevation: 2, // Button elevation
  //   ),
  // ),

  // Define icon themes
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),

  // Define input decoration themes (for text fields)
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.black),
    hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
  ),

  // Define the bottom navigation bar theme
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.white,
  ),

  // Define the tab bar theme (if your app uses tabs)
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.blue,
    unselectedLabelColor: Colors.white,
  ),
);
