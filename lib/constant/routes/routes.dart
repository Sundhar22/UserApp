import 'package:flutter/material.dart';
import 'package:user_app/features/order/ui/order.dart';
import 'package:user_app/src/features/auth/presentation/pages/otp_screen.dart';
import 'package:user_app/src/features/auth/presentation/pages/user_deatils_reg.dart';
import 'package:user_app/src/features/auth/presentation/pages/user_registration.dart';
import 'package:user_app/src/features/booking/presentation/pages/booking.dart';
import 'package:user_app/src/features/home/presentation/pages/home.dart';
import 'package:user_app/src/features/location/presentation/pages/user_choice.dart';
import 'package:user_app/src/features/location/presentation/pages/user_location.dart';
import 'package:user_app/src/features/onboarding/presentation/pages/onboarding_page.dart';



Map<String, WidgetBuilder> get getPageRoutes {
  return <String, WidgetBuilder>{
    // 'nav': (context) => const NavBar(),
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
