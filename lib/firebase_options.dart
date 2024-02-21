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
    apiKey: 'AIzaSyCEwi1ATNC2pk9dhUvi0iTjryO8Cmh_AyA',
    appId: '1:260074362770:web:891d43e65bef5d9b83534b',
    messagingSenderId: '260074362770',
    projectId: 'my-notes-e89db',
    authDomain: 'my-notes-e89db.firebaseapp.com',
    storageBucket: 'my-notes-e89db.appspot.com',
    measurementId: 'G-TZMSMY95FF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOBXbmTSPq3qdKfBJqSN1HOuG2e1tq8sY',
    appId: '1:260074362770:android:72b7aeff209b03b383534b',
    messagingSenderId: '260074362770',
    projectId: 'my-notes-e89db',
    storageBucket: 'my-notes-e89db.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPj3kAQOcwfwcqBzuXmUjqM9HAWNoVhjo',
    appId: '1:260074362770:ios:870ed2dc5a14cb2083534b',
    messagingSenderId: '260074362770',
    projectId: 'my-notes-e89db',
    storageBucket: 'my-notes-e89db.appspot.com',
    iosBundleId: 'com.example.myNotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPj3kAQOcwfwcqBzuXmUjqM9HAWNoVhjo',
    appId: '1:260074362770:ios:1a523bf55847f9e483534b',
    messagingSenderId: '260074362770',
    projectId: 'my-notes-e89db',
    storageBucket: 'my-notes-e89db.appspot.com',
    iosBundleId: 'com.example.myNotes.RunnerTests',
  );
}
