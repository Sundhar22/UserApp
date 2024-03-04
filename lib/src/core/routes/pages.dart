import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/core/routes/routes.dart';
import 'package:user_app/src/core/services/services.dart';
import 'package:user_app/src/features/auth/presentation/pages/otp_screen.dart';
import 'package:user_app/src/features/booking/presentation/pages/booking.dart';
import 'package:user_app/src/features/location/presentation/bloc/location_bloc.dart';
import 'package:user_app/src/features/location/presentation/pages/user_choice.dart';
import 'package:user_app/src/features/location/presentation/pages/user_location.dart';
import 'package:user_app/src/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:user_app/src/features/order/presentation/pages/order.dart';
import 'package:user_app/src/features/profile/data/implements/profile_edit_implementation.dart';
import 'package:user_app/src/features/profile/data/sources/profile_details_fetch.dart';
import 'package:user_app/src/features/profile/data/sources/profile_details_update.dart';
import 'package:user_app/src/features/profile/domain/repositories/profile_edit_repository.dart';
import 'package:user_app/src/features/profile/domain/usecases/fetch_user_details_usecase.dart';
import 'package:user_app/src/features/profile/domain/usecases/update_user_details_usecase.dart';
import 'package:user_app/src/features/profile/presentation/bloc/customerservice_bloc/customerservice_bloc.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:user_app/src/features/profile/presentation/pages/pages.dart';
import 'package:user_app/src/features/profile/presentation/widgets/customerservice_ui.dart';
import 'package:user_app/src/features/profile/presentation/widgets/profile_edit_page.dart';
import '../../features/application/presentation/pages/app_pages.dart';
import '../../features/auth/presentation/bloc/register_bloc.dart';
import '../../features/auth/presentation/pages/user_deatils_reg.dart';
import '../../features/auth/presentation/pages/user_registration.dart';
import '../../features/booking/presentation/bloc/booking_bloc.dart';
import '../../features/booking/presentation/functions/booking_firebase.dart';
import '../../features/onboarding/presentation/bloc/onboarding_bloc.dart';
import '../animation/animation.dart';

class AppRoute {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: RoutesName.initial,
          bloc: BlocProvider(create: (context) => OnboardingBloc()),
          pages: const OnBoardingPage()),
      PageEntity(
          route: RoutesName.login,
          bloc: BlocProvider(create: (context) => RegisterBloc()),
          pages: const UserRegistrationScreen()),
      PageEntity(
          route: RoutesName.otp,
          bloc: BlocProvider(create: (context) => RegisterBloc()),
          pages: const OtpScreen()),
      PageEntity(
          route: RoutesName.register,
          bloc: BlocProvider(create: (context) => RegisterBloc()),
          pages: const UserDetailsReg()),
      PageEntity(
          route: RoutesName.location,
          bloc: BlocProvider(create: (context) => locator<LocationBloc>()),
          pages: const UserLocationChoice()),
      PageEntity(
          route: RoutesName.saveLocation,
          bloc: BlocProvider(create: (context) => locator<LocationBloc>()),
          pages: const UserLocation()),
      PageEntity(
          route: RoutesName.appPage,
          bloc: BlocProvider(create: (context) => RegisterBloc()),
          pages: const ApplicationPage()),
      PageEntity(
          route: RoutesName.order,
          bloc: BlocProvider(create: (context) => OrderBloc()),
          pages: const OrderPage()),
      PageEntity(
          route: RoutesName.customerService,
          bloc: BlocProvider(create: (context) => ChatBloc()),
          pages: const CustomerService()),
      PageEntity(
          route: RoutesName.booking,
          bloc: BlocProvider(
              create: (context) => BookingBloc(
                  bookingFirestoreService: BookingFirestoreService())),
          pages: const BookingPage()),
      PageEntity(
          route: RoutesName.profileEdit,
          bloc: BlocProvider(
              create: (context) => ProfileBloc(
                  FetchUserDetailsUsecase(ProfileEditImpl(
                    UserDetailsFetchSource(),
                    UserDetailsUpdateSource(),
                  )),
                  UpdateUserDetailsUsecae(ProfileEditImpl(
                    UserDetailsFetchSource(),
                    UserDetailsUpdateSource(),
                  )))),
          pages: ProfileEditPage()),
      PageEntity(
          route: RoutesName.profile,
          bloc: BlocProvider(
              create: (context) => ProfileBloc(
                  FetchUserDetailsUsecase(ProfileEditImpl(
                    UserDetailsFetchSource(),
                    UserDetailsUpdateSource(),
                  )),
                  UpdateUserDetailsUsecae(ProfileEditImpl(
                    UserDetailsFetchSource(),
                    UserDetailsUpdateSource(),
                  )))),
          pages: const ProfilePage())
    ];
  }

  List<BlocProvider> allBlocProvider() {
    var blocs = <BlocProvider>[];
    routes().forEach((element) {
      if (!blocs.contains(element.bloc)) {
        blocs.add(element.bloc);
      }
    });
    return blocs;
  }

  static Route<dynamic> generate(RouteSettings? settings) {
    if (settings!.name != null) {
      var route = routes().where((element) => element.route == settings.name);

      if (route.isNotEmpty) {
        return getAnimateRoute(
          route.first.pages,
          settings,
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
  String route;
  dynamic bloc;
  Widget pages;
  PageEntity({
    required this.route,
    required this.bloc,
    required this.pages,
  });
}
