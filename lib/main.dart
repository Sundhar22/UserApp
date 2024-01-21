import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/constant/bloc_provider/bloc_providers.dart';
import 'package:user_app/constant/routes/routes.dart';


import 'package:flutter/material.dart';import 'package:user_app/root_app.dart';
import 'package:user_app/src/core/theme/theme.dart';

import 'src/core/config/config.dart';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.get(),
      child: ScreenUtilInit(
        child: MaterialApp(
          title: 'User App',
          debugShowCheckedModeBanner: false,
          theme: buildApp(context),
          routes: getPageRoutes,
          initialRoute: 'order',
        ),
      ),
    );
  }

