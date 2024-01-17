library theme;

import 'package:flutter/material.dart';

import '../constants/constants.dart';
ThemeData buildApp() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: Colors.black,
      scrolledUnderElevation: 0,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
    fontFamily: 'Urbanist',
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        shape: MaterialStatePropertyAll(
          StadiumBorder(),
        ),
        padding: MaterialStatePropertyAll(EdgeInsets.all(16)),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(
          Colors.black,
        ),
      ),
    ),
  );
}
