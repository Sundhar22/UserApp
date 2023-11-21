import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/constant/theme/app_theme.dart';

import 'package:user_app/features/booking/ui/booking_page.dart';
import 'package:user_app/features/home/ui/home.dart';
import 'package:user_app/features/onboarding/ui/pages/onboarding_page.dart';
import 'package:user_app/features/onboarding/ui/pages/otp_screen.dart';
import 'package:user_app/features/onboarding/ui/pages/user_registration.dart';
import 'package:user_app/features/userLocation/user_choice/user_choice.dart';
import 'package:user_app/features/userLocation/user_selected/user_location.dart';
import 'package:user_app/features/widgets/nav_bar/nav_bar.dart';

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
        theme: buildApp(),

        initialRoute: 'nav',
        routes: {
          'nav': (context) => const NavBar(),

          'register': (context) => const UserRegistrationScreen(),
          'otp': (context) => const OtpScreen(),
          'onboarding': (context) => const OnBoardingPage(),
          'user-location': (context) => const UserLocation(),
          'user-location-choice': (context) => const UserLocationChoice(),
          'home': (context) => const HomePage(),
          'booking': (context) => const BookingPage(),
        },
      ),
    );
  }
}
