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
    apiKey: 'AIzaSyBduCbFulS7yoZoFuw5IeIGmh3N1OvNZdY',
    appId: '1:620522314877:web:6d934508ba95b72778e514',
    messagingSenderId: '620522314877',
    projectId: 'mis-lab-b6859',
    authDomain: 'mis-lab-b6859.firebaseapp.com',
    storageBucket: 'mis-lab-b6859.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkFLrA9NSgO0PFsXN0e0r44aCNddf4jl0',
    appId: '1:620522314877:android:864127cad709c5b878e514',
    messagingSenderId: '620522314877',
    projectId: 'mis-lab-b6859',
    storageBucket: 'mis-lab-b6859.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3ZW7bHz-jy7Y7RIfwT1RDnLnSEJlJNL0',
    appId: '1:620522314877:ios:e5ee0ffc40c0245978e514',
    messagingSenderId: '620522314877',
    projectId: 'mis-lab-b6859',
    storageBucket: 'mis-lab-b6859.appspot.com',
    iosBundleId: 'mk.ukim.finki.mis.mis5',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3ZW7bHz-jy7Y7RIfwT1RDnLnSEJlJNL0',
    appId: '1:620522314877:ios:662f5a5dd004876e78e514',
    messagingSenderId: '620522314877',
    projectId: 'mis-lab-b6859',
    storageBucket: 'mis-lab-b6859.appspot.com',
    iosBundleId: 'mk.ukim.finki.mis.mis5.RunnerTests',
  );
}
