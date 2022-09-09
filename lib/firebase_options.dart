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
    apiKey: 'AIzaSyDdlH93EXW57WucfW0EsZnPhKXadVlj9kQ',
    appId: '1:193886480722:web:3bb80c87dff10d1040728b',
    messagingSenderId: '193886480722',
    projectId: 'weather-51a5f',
    authDomain: 'weather-51a5f.firebaseapp.com',
    storageBucket: 'weather-51a5f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSY3HQ4j0FeLM8JaZ_TIvwrtxO3onaLpY',
    appId: '1:193886480722:android:1b6f8b2a4c214d3940728b',
    messagingSenderId: '193886480722',
    projectId: 'weather-51a5f',
    storageBucket: 'weather-51a5f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDh5tSxWfgU6-KGpkVSbxO0g5ECxbaSOKQ',
    appId: '1:193886480722:ios:2ce5e529b7508db740728b',
    messagingSenderId: '193886480722',
    projectId: 'weather-51a5f',
    storageBucket: 'weather-51a5f.appspot.com',
    iosClientId: '193886480722-1d51eais6btbkdv7arpp1kn4og35lang.apps.googleusercontent.com',
    iosBundleId: 'com.example.weatherProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDh5tSxWfgU6-KGpkVSbxO0g5ECxbaSOKQ',
    appId: '1:193886480722:ios:2ce5e529b7508db740728b',
    messagingSenderId: '193886480722',
    projectId: 'weather-51a5f',
    storageBucket: 'weather-51a5f.appspot.com',
    iosClientId: '193886480722-1d51eais6btbkdv7arpp1kn4og35lang.apps.googleusercontent.com',
    iosBundleId: 'com.example.weatherProject',
  );
}
