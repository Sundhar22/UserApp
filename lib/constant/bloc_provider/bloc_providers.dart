import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:user_app/src/features/auth/presentation/bloc/register_bloc.dart';
import 'package:user_app/src/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_bloc.dart';



class BlocProviders {
  static get() => [
        BlocProvider(create: (context) => OnboardingBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => OrderBloc()),
      ];
}
