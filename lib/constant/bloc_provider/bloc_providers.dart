import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/features/auth/bloc/register_bloc.dart';
import 'package:user_app/features/order/bloc/order_bloc.dart';

import '../../features/onboarding/bloc/onboarding_bloc.dart';

class BlocProviders {
  static get() => [
        BlocProvider(create: (context) => OnboardingBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => OrderBloc()),
      ];
}
