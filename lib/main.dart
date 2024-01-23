import 'dart:async';

import 'package:flutter/material.dart';
import 'package:user_app/root_app.dart';
import 'package:user_app/src/core/routes/pages.dart';

import 'src/core/config/config.dart';

Future<void> main() async {
  //  Here we are calling the Dependency Injection

  await DependencyInjection.init();
  //  This is the main app
  // print(AppRoute.blocProvider());
  runApp(const RootApp());
}
