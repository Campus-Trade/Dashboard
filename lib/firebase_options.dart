import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDPC3kGbLlUbgRkhKO7yG8rluE21QWsdpU',
    appId: '1:830177900227:web:56c364895bc38524941476',
    messagingSenderId: '830177900227',
    projectId: 'campus-trade1',
    authDomain: 'campus-trade1.firebaseapp.com',
    storageBucket: 'campus-trade1.firebasestorage.app',
    measurementId: 'G-097V6DLPXM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFLlgzAV9XVt4mGwqR6sNg9nr34x_oz9c',
    appId: '1:830177900227:android:c79954b5c8ec1855941476',
    messagingSenderId: '830177900227',
    projectId: 'campus-trade1',
    storageBucket: 'campus-trade1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDeueny1nCvkKtvtJPzDBNCgJC4PzQwQPA',
    appId: '1:830177900227:ios:6cdd4f68286a65ed941476',
    messagingSenderId: '830177900227',
    projectId: 'campus-trade1',
    storageBucket: 'campus-trade1.firebasestorage.app',
    iosClientId:
        '830177900227-rj2q1kilsit286ioshtuo1md3jnc3utr.apps.googleusercontent.com',
    iosBundleId: 'com.example.dashboard',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDeueny1nCvkKtvtJPzDBNCgJC4PzQwQPA',
    appId: '1:830177900227:ios:6cdd4f68286a65ed941476',
    messagingSenderId: '830177900227',
    projectId: 'campus-trade1',
    storageBucket: 'campus-trade1.firebasestorage.app',
    iosClientId:
        '830177900227-rj2q1kilsit286ioshtuo1md3jnc3utr.apps.googleusercontent.com',
    iosBundleId: 'com.example.dashboard',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDPC3kGbLlUbgRkhKO7yG8rluE21QWsdpU',
    appId: '1:830177900227:web:7701890fb9d4e86b941476',
    messagingSenderId: '830177900227',
    projectId: 'campus-trade1',
    authDomain: 'campus-trade1.firebaseapp.com',
    storageBucket: 'campus-trade1.firebasestorage.app',
    measurementId: 'G-2M200NXG74',
  );
}
