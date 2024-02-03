library dependency_injection;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_app/src/core/config/firebase_options.dart';
import 'package:user_app/src/core/services/services.dart';

import '../services/storage_service.dart';

class DependencyInjection {
  static late StorageService storageService;
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    storageService = StorageService();
    await storageService.init();
    setUpLocator();
  }
}
