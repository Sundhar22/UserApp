import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/constant/colors/app_color.dart';
import 'package:user_app/interface/userLocation/user_choice/user_choice.dart';

import 'interface/onboarding/onboarding_page.dart';
import 'interface/userLocation/user_selected/user_location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        title: 'User App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
          fontFamily: 'Urbanist',
        ),
        initialRoute: 'user-location-choice',
        routes: {
          '/onboarding': (context) => const OnBoardingPage(),
          'user-location': (context) => const UserLocation(),
          'user-location-choice': (context) => const UserLocationChoice(),
        },
      ),
    );
  }
}
