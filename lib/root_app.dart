import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/core/routes/routes.dart';
import 'package:user_app/src/core/services/services.dart';
import 'package:user_app/src/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:user_app/src/features/booking/presentation/functions/booking_firebase.dart';
import 'package:user_app/src/features/location/presentation/bloc/location_bloc.dart';
import 'package:user_app/src/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_bloc.dart';

import 'src/core/config/config.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<LocationBloc>()),
        BlocProvider(create: (context) => OrderBloc()),
        BlocProvider(create: (context) => OnboardingBloc()),
        BlocProvider(
            create: (context) => BookingBloc(
                bookingFirestoreService: BookingFirestoreService())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, ch) => const DismissKeyboard(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RoutesName.appPage,
            onGenerateRoute: AppRoute.generate,
          ),
        ),
      ),
    );
  }
}
