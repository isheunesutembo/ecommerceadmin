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
    apiKey: 'AIzaSyA4YTbItzGc-ollvD2hkJcuGe2cx4gQv5Y',
    appId: '1:150558134205:web:49c2d374094b5b319b8cd4',
    messagingSenderId: '150558134205',
    projectId: 'ephamarcyapp',
    authDomain: 'ephamarcyapp.firebaseapp.com',
    storageBucket: 'ephamarcyapp.appspot.com',
    measurementId: 'G-RGFSR20239',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCe6V1EA4PESCG0otQW-CePwXd4-gv5SOY',
    appId: '1:150558134205:android:5290434ed94b3e629b8cd4',
    messagingSenderId: '150558134205',
    projectId: 'ephamarcyapp',
    storageBucket: 'ephamarcyapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDrBpAHr1lAncIq4e9jIOe2w64kqAnePWI',
    appId: '1:150558134205:ios:57e423dc0e2726d09b8cd4',
    messagingSenderId: '150558134205',
    projectId: 'ephamarcyapp',
    storageBucket: 'ephamarcyapp.appspot.com',
    iosBundleId: 'com.example.ecommerceadmin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDrBpAHr1lAncIq4e9jIOe2w64kqAnePWI',
    appId: '1:150558134205:ios:7f2c12d428c1734c9b8cd4',
    messagingSenderId: '150558134205',
    projectId: 'ephamarcyapp',
    storageBucket: 'ephamarcyapp.appspot.com',
    iosBundleId: 'com.example.ecommerceadmin.RunnerTests',
  );
}
