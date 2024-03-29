// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD8Pdg-gOoC9Wru_eDGjUEYM7fz_1qtAws',
    appId: '1:778159652373:web:bc4d65337460a24888d81c',
    messagingSenderId: '778159652373',
    projectId: 'userapp-402806',
    authDomain: 'userapp-402806.firebaseapp.com',
    storageBucket: 'userapp-402806.appspot.com',
    measurementId: 'G-V0ZTFQP0BC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRLPRTn70B9eu3vmuIb_fnC1ljcmk4ir8',
    appId: '1:778159652373:android:e6a9a80433f8d28b88d81c',
    messagingSenderId: '778159652373',
    projectId: 'userapp-402806',
    storageBucket: 'userapp-402806.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbu5zGGmyqDa_i6tk6SYW8RZurdrtFGEQ',
    appId: '1:778159652373:ios:d6bcd916502a8c8088d81c',
    messagingSenderId: '778159652373',
    projectId: 'userapp-402806',
    storageBucket: 'userapp-402806.appspot.com',
    iosBundleId: 'com.example.userApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBbu5zGGmyqDa_i6tk6SYW8RZurdrtFGEQ',
    appId: '1:778159652373:ios:35123d1914ab2d7188d81c',
    messagingSenderId: '778159652373',
    projectId: 'userapp-402806',
    storageBucket: 'userapp-402806.appspot.com',
    iosBundleId: 'com.example.userApp.RunnerTests',
  );
}
