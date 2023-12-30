import 'package:flutter/material.dart';
import 'package:user_app/constant/colors/app_color.dart';

ThemeData buildApp(BuildContext context) {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        scrolledUnderElevation: 0,
      ),
      dropdownMenuTheme: const DropdownMenuThemeData(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        menuStyle: MenuStyle(
          surfaceTintColor: MaterialStatePropertyAll(Colors.blue),
          shape: MaterialStatePropertyAll(BeveledRectangleBorder()),
        ),
      ),
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      radioTheme: const RadioThemeData(
        splashRadius: 0,
        visualDensity: VisualDensity.compact,
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
      timePickerTheme: TimePickerThemeData(
        elevation: 0,
        dialBackgroundColor: Colors.grey.withOpacity(.1),
        backgroundColor: Colors.white,
        // dialTextColor: Colors.red,
        hourMinuteTextColor: Colors.black,
        hourMinuteColor: Colors.grey.withOpacity(.1),
      ));
}
