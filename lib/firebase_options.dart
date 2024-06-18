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
    apiKey: 'AIzaSyDuC3GseetQugyOs3AVrsNM_noznzb_zQ0',
    appId: '1:208792188550:web:c64a5a290cf81a92afc307',
    messagingSenderId: '208792188550',
    projectId: 'uaspemob-1132b',
    authDomain: 'uaspemob-1132b.firebaseapp.com',
    storageBucket: 'uaspemob-1132b.appspot.com',
    measurementId: 'G-66D275PE97',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8ku793yEBtSAr6BmGZQPw7tSVnI5YlBQ',
    appId: '1:208792188550:android:320aa72a242a4cdeafc307',
    messagingSenderId: '208792188550',
    projectId: 'uaspemob-1132b',
    storageBucket: 'uaspemob-1132b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqVPZ3fWpQoIT8qP34WIyOZMuqt21j-Mc',
    appId: '1:208792188550:ios:7c0ba03ce2f81c80afc307',
    messagingSenderId: '208792188550',
    projectId: 'uaspemob-1132b',
    storageBucket: 'uaspemob-1132b.appspot.com',
    iosBundleId: 'com.example.projectuas',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDqVPZ3fWpQoIT8qP34WIyOZMuqt21j-Mc',
    appId: '1:208792188550:ios:7c0ba03ce2f81c80afc307',
    messagingSenderId: '208792188550',
    projectId: 'uaspemob-1132b',
    storageBucket: 'uaspemob-1132b.appspot.com',
    iosBundleId: 'com.example.projectuas',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDuC3GseetQugyOs3AVrsNM_noznzb_zQ0',
    appId: '1:208792188550:web:be7c82c7304d4cadafc307',
    messagingSenderId: '208792188550',
    projectId: 'uaspemob-1132b',
    authDomain: 'uaspemob-1132b.firebaseapp.com',
    storageBucket: 'uaspemob-1132b.appspot.com',
    measurementId: 'G-FQDH02FMPE',
  );
}
