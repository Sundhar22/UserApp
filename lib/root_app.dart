import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/core/routes/routes.dart';

import 'src/core/config/config.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.get(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, ch) => const DismissKeyboard(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RoutesName.initial,
            onGenerateRoute: AppRoute.generate,
          ),
        ),
      ),
    );
  }
}
