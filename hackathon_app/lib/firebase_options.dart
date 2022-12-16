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
    apiKey: 'AIzaSyAdQ4sJgbF2KGoC9MDAfKzGwVt2uROt3ng',
    appId: '1:434117415029:web:ddfff3e6fb702c999b683c',
    messagingSenderId: '434117415029',
    projectId: 'barter-buddy',
    authDomain: 'barter-buddy.firebaseapp.com',
    storageBucket: 'barter-buddy.appspot.com',
    measurementId: 'G-PZJ16X9XSD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLfvKgVglJQ-bVanbEaYW5OFyZ6qJ9kwQ',
    appId: '1:434117415029:android:c7256d7e00a4c1b59b683c',
    messagingSenderId: '434117415029',
    projectId: 'barter-buddy',
    storageBucket: 'barter-buddy.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUe91mj_WWdxHe72-qNhG-1XFT4uDE2LI',
    appId: '1:434117415029:ios:34d4c48f0ad2a17c9b683c',
    messagingSenderId: '434117415029',
    projectId: 'barter-buddy',
    storageBucket: 'barter-buddy.appspot.com',
    androidClientId: '434117415029-rve46784jumj5og7ga0p54ie3pqgbndp.apps.googleusercontent.com',
    iosClientId: '434117415029-m0s1s4h02st824c703hacpihur1jsmb6.apps.googleusercontent.com',
    iosBundleId: 'com.example.hackathonApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBUe91mj_WWdxHe72-qNhG-1XFT4uDE2LI',
    appId: '1:434117415029:ios:34d4c48f0ad2a17c9b683c',
    messagingSenderId: '434117415029',
    projectId: 'barter-buddy',
    storageBucket: 'barter-buddy.appspot.com',
    androidClientId: '434117415029-rve46784jumj5og7ga0p54ie3pqgbndp.apps.googleusercontent.com',
    iosClientId: '434117415029-m0s1s4h02st824c703hacpihur1jsmb6.apps.googleusercontent.com',
    iosBundleId: 'com.example.hackathonApp',
  );
}