import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/constant/bloc_provider/bloc_providers.dart';
import 'package:user_app/constant/theme/app_theme.dart';
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
import 'package:user_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.get(),
      child: ScreenUtilInit(
        child: MaterialApp(
          title: 'User App',
          debugShowCheckedModeBanner: false,
          theme: buildApp(context),
          initialRoute: 'order',
          routes: {
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
          },
        ),
      ),
    );
  }
}
