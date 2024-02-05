import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/core/routes/routes.dart';
import 'package:user_app/src/features/home/presentation/pages/home.dart';

import 'src/core/config/config.dart';
import 'src/core/theme/theme.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppRoute().allBlocProvider(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, ch) => DismissKeyboard(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
            onGenerateRoute: AppRoute.generate,
            theme: buildApp(),
          ),
        ),
      ),
    );
  }
}
