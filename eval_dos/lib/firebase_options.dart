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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB9rjI4JNrrlcRGCtpZ7kovm00rfDuTcMc',
    appId: '1:945384450238:web:de2e68cdea1c2bb4f6d6ef',
    messagingSenderId: '945384450238',
    projectId: 'actividad1app3',
    authDomain: 'actividad1app3.firebaseapp.com',
    storageBucket: 'actividad1app3.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLaVCRAMX1nBGPv2-s0aguprWKs5vF3iM',
    appId: '1:945384450238:android:5c2495d26a4328c2f6d6ef',
    messagingSenderId: '945384450238',
    projectId: 'actividad1app3',
    storageBucket: 'actividad1app3.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB9rjI4JNrrlcRGCtpZ7kovm00rfDuTcMc',
    appId: '1:945384450238:web:8738744160f951eaf6d6ef',
    messagingSenderId: '945384450238',
    projectId: 'actividad1app3',
    authDomain: 'actividad1app3.firebaseapp.com',
    storageBucket: 'actividad1app3.firebasestorage.app',
  );
}
