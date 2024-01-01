import 'package:flutter/material.dart';

import 'package:user_app/features/auth/ui/otp_screen.dart';
import 'package:user_app/features/auth/ui/user_deatils_reg.dart';
import 'package:user_app/features/auth/ui/user_registration.dart';
import 'package:user_app/features/booking/ui/booking.dart';
import 'package:user_app/features/home/ui/home.dart';
import 'package:user_app/features/onboarding/ui/pages/onboarding_page.dart';
import 'package:user_app/features/order/ui/order.dart';
import 'package:user_app/features/userLocation/user_choice/user_choice.dart';
import 'package:user_app/features/userLocation/user_selected/user_location.dart';
import 'package:user_app/features/widgets/nav_bar/nav_bar.dart';

Map<String, WidgetBuilder> get getPageRoutes {
  return <String, WidgetBuilder>{
    'nav': (context) => const NavBar(),
    'register': (context) => const UserRegistrationScreen(),
    'otp': (context) => const OtpScreen(),
    'onboarding': (context) => const OnBoardingPage(),
    'user-location': (context) => const UserLocation(),
    'user-location-choice': (context) => const UserLocationChoice(),
    'home': (context) => const HomePage(),
    'booking': (context) => const BookingPage(),
    'user-details-reg': (context) => const UserDetailsReg(),
    'order': (context) => const OrderPage(),
  };
}
