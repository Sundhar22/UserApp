import 'package:flutter/material.dart';
import 'package:user_app/constant/colors/app_color.dart';

ThemeData buildApp() {
  return ThemeData(
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
      iconColor: MaterialStatePropertyAll(Colors.black),
    )),
  );
}
