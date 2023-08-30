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
    apiKey: 'AIzaSyAM1a1OgPm5OQfV6M0JspomIA7EBYEXVRs',
    appId: '1:575844294207:web:739919c7c9e9f387dd228a',
    messagingSenderId: '575844294207',
    projectId: 'tsr-monitoring-app',
    authDomain: 'tsr-monitoring-app.firebaseapp.com',
    storageBucket: 'tsr-monitoring-app.appspot.com',
    measurementId: 'G-NEZYPKP3PJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6sipM6apzAbIyfqZrSMLx7yYuXz1ylgw',
    appId: '1:575844294207:android:c83a0987662c8cb5dd228a',
    messagingSenderId: '575844294207',
    projectId: 'tsr-monitoring-app',
    storageBucket: 'tsr-monitoring-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZaO4DoSelhqYIfDqZUY13cF1eWLMa9Ok',
    appId: '1:575844294207:ios:762b855eb0cf14fbdd228a',
    messagingSenderId: '575844294207',
    projectId: 'tsr-monitoring-app',
    storageBucket: 'tsr-monitoring-app.appspot.com',
    iosClientId: '575844294207-59ikjdfqtj2lm08tfsiqbadbhchdhflm.apps.googleusercontent.com',
    iosBundleId: 'com.example.tsrMonitoringApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAZaO4DoSelhqYIfDqZUY13cF1eWLMa9Ok',
    appId: '1:575844294207:ios:ddad345a47d86038dd228a',
    messagingSenderId: '575844294207',
    projectId: 'tsr-monitoring-app',
    storageBucket: 'tsr-monitoring-app.appspot.com',
    iosClientId: '575844294207-6b81glj42k1qfti0fm39o96e4ajvcc54.apps.googleusercontent.com',
    iosBundleId: 'com.example.tsrMonitoringApp.RunnerTests',
  );
}
