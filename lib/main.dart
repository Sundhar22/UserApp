import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/constant/theme/app_theme.dart';
import 'package:user_app/interface/onboarding/mail_verification.dart';
import 'package:user_app/interface/onboarding/otp_screen.dart';
import 'package:user_app/interface/onboarding/user_registration.dart';
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
        theme: buildApp(),
        initialRoute: 'otp',
        routes: {
          'register': (context) => const UserRegistrationScreen(),
          'otp': (context) => const OtpScreen(),
          'onboarding': (context) => const OnBoardingPage(),
          'user-location': (context) => const UserLocation(),
          'user-location-choice': (context) => const UserLocationChoice(),
          'mail-verification': (context) => const MailVerification(),
        },
      ),
    );
  }
}
