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
    apiKey: 'AIzaSyD-1cC67YSW2sIBxEKnqv9EkIrTQSs22nA',
    appId: '1:305487739772:web:587faa7b587e34966fc2f9',
    messagingSenderId: '305487739772',
    projectId: 'fima-af735',
    authDomain: 'fima-af735.firebaseapp.com',
    storageBucket: 'fima-af735.appspot.com',
    measurementId: 'G-MB1LZ0ZWK2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDg9qoZPJ-Q1kGlP0XUlCCEJlFwVfrZHr4',
    appId: '1:305487739772:android:c90d0eaa33f203296fc2f9',
    messagingSenderId: '305487739772',
    projectId: 'fima-af735',
    storageBucket: 'fima-af735.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqE6mqdH1vX-Mg0UFL5WnmCr4Bb9NJxoc',
    appId: '1:305487739772:ios:ccc1ccc623fcf5976fc2f9',
    messagingSenderId: '305487739772',
    projectId: 'fima-af735',
    storageBucket: 'fima-af735.appspot.com',
    iosBundleId: 'com.example.fima',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDqE6mqdH1vX-Mg0UFL5WnmCr4Bb9NJxoc',
    appId: '1:305487739772:ios:1664c2abaf9324a56fc2f9',
    messagingSenderId: '305487739772',
    projectId: 'fima-af735',
    storageBucket: 'fima-af735.appspot.com',
    iosBundleId: 'com.example.fima.RunnerTests',
  );
}