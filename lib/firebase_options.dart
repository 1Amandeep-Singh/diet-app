// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyB7KG7m3CaYW057HXQNoccyinqP3c4ynr4',
    appId: '1:941781372662:web:169ae7f162694b64bf26d7',
    messagingSenderId: '941781372662',
    projectId: 'samplefirebase-ba197',
    authDomain: 'samplefirebase-ba197.firebaseapp.com',
    storageBucket: 'samplefirebase-ba197.appspot.com',
    measurementId: 'G-7SYCHHVRTQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBtR2AGB_Ym5ifL6WQ5U9paNj5qkOG46Bw',
    appId: '1:941781372662:android:0f69a7b362e4cc06bf26d7',
    messagingSenderId: '941781372662',
    projectId: 'samplefirebase-ba197',
    storageBucket: 'samplefirebase-ba197.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCuv2BpDLYX0drccmcFUGcj5XbI99lypMQ',
    appId: '1:941781372662:ios:0ea18304d837613cbf26d7',
    messagingSenderId: '941781372662',
    projectId: 'samplefirebase-ba197',
    storageBucket: 'samplefirebase-ba197.appspot.com',
    iosClientId: '941781372662-31pt6eoqurl5fa72q0095q5rpkheh4kc.apps.googleusercontent.com',
    iosBundleId: 'com.example.diet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCuv2BpDLYX0drccmcFUGcj5XbI99lypMQ',
    appId: '1:941781372662:ios:0ea18304d837613cbf26d7',
    messagingSenderId: '941781372662',
    projectId: 'samplefirebase-ba197',
    storageBucket: 'samplefirebase-ba197.appspot.com',
    iosClientId: '941781372662-31pt6eoqurl5fa72q0095q5rpkheh4kc.apps.googleusercontent.com',
    iosBundleId: 'com.example.diet',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB7KG7m3CaYW057HXQNoccyinqP3c4ynr4',
    appId: '1:941781372662:web:ebc25d949fe644febf26d7',
    messagingSenderId: '941781372662',
    projectId: 'samplefirebase-ba197',
    authDomain: 'samplefirebase-ba197.firebaseapp.com',
    storageBucket: 'samplefirebase-ba197.appspot.com',
    measurementId: 'G-XW27E8495K',
  );
}
