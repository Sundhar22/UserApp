// ignore_for_file: public_member_api_docs, sort_constructors_first
library route_pages;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/features/application/presentation/bloc/application_bloc.dart';
import 'package:user_app/src/features/application/presentation/pages/app_pages.dart';
import 'package:user_app/src/features/auth/presentation/pages/otp_screen.dart';
import 'package:user_app/src/features/auth/presentation/pages/user_deatils_reg.dart';
import 'package:user_app/src/features/location/presentation/bloc/location_bloc.dart';
import 'package:user_app/src/features/location/presentation/pages/user_choice.dart';
import 'package:user_app/src/features/location/presentation/pages/user_location.dart';
import 'package:user_app/src/features/onboarding/presentation/pages/onboarding_page.dart';

import '../../features/auth/presentation/bloc/register_bloc.dart';
import '../../features/auth/presentation/pages/user_registration.dart';
import '../../features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'routes.dart';

class AppRoute {
  static List<PageEntity> route = [
    PageEntity(
        bloc: OnboardingBloc(),
        page: const OnBoardingPage(),
        route: RoutesName.initial),
    PageEntity(
        bloc: RegisterBloc(),
        page: const UserRegistrationScreen(),
        route: RoutesName.login),
    PageEntity(
      bloc: RegisterBloc(),
      page: const OtpScreen(),
      route: RoutesName.otp,
    ),
    PageEntity(
        bloc: RegisterBloc(),
        page: const UserDetailsReg(),
        route: RoutesName.register),
    PageEntity(
        route:RoutesName.saveLocation,
        bloc: LocationBloc,
        page: const UserLocation()),
    PageEntity(
        route:  RoutesName.location,
        bloc: LocationBloc,
        page: const UserLocationChoice()),
    PageEntity(
        route: RoutesName.appPage,
        bloc: ApplicationBloc,
        page: const ApplicationPage())
  ];

  static List<BlocProvider> blocProvider() {
    var blocs = <BlocProvider>[];

    for (var element in route) {
      if (!blocs.contains(element.bloc)) {
        blocs.add(BlocProvider(create: (context) => element.bloc));
      }
    }
    return blocs;
  }

  static const initial = RoutesName.initial;

  static Route<dynamic> generate(RouteSettings? settings) {
    if (settings!.name != null) {
      var result = route.where((element) => element.route == settings.name);

      if (result.isNotEmpty) {
        return MaterialPageRoute(
          builder: (context) => result.first.page,
          settings: settings,
        );
      }
    }

    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      ),
      settings: settings,
    );
  }
}

class PageEntity {
  final String route;
  dynamic bloc;
  final Widget page;
  PageEntity({
    required this.route,
    required this.bloc,
    required this.page,
  });
}

class BlocProviders {
  static get() => [
        BlocProvider(create: (context) => OnboardingBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
      ];
}
