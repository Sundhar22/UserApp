import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/constant/bloc_provider/bloc_providers.dart';
import 'package:user_app/constant/routes/routes.dart';
import 'package:user_app/constant/theme/app_theme.dart';
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
          routes: getPageRoutes,
          initialRoute: 'order',
        ),
      ),
    );
  }
}
