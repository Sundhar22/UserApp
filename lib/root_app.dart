import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/core/routes/routes.dart';
import 'package:user_app/src/core/services/services.dart';
import 'package:user_app/src/features/location/presentation/bloc/location_bloc.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_bloc.dart';

import 'src/core/config/config.dart';
import 'src/core/theme/theme.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<LocationBloc>()),
        BlocProvider(create: (context) => OrderBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, ch) => DismissKeyboard(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RoutesName.order,
            onGenerateRoute: AppRoute.generate,
            theme: buildApp(),
          ),
        ),
      ),
    );
  }
}
