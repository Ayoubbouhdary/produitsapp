import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDYujG9maYAKRxzfAnsn7NcFvDXUP5uctI',
    authDomain: 'flutterproject-d0442.firebaseapp.com',
    projectId: 'flutterproject-d0442',
    storageBucket: 'flutterproject-d0442.firebasestorage.app',
    messagingSenderId: '217946215072',
    appId: '1:217946215072:web:762dcd2ba95e6720eb6fc5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYujG9maYAKRxzfAnsn7NcFvDXUP5uctI',
    appId: '1:217946215072:android:762dcd2ba95e6720eb6fc5',
    messagingSenderId: '217946215072',
    projectId: 'flutterproject-d0442',
    storageBucket: 'flutterproject-d0442.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYujG9maYAKRxzfAnsn7NcFvDXUP5uctI',
    appId: '1:217946215072:ios:762dcd2ba95e6720eb6fc5',
    messagingSenderId: '217946215072',
    projectId: 'flutterproject-d0442',
    storageBucket: 'flutterproject-d0442.firebasestorage.app',
    iosBundleId: 'com.example.produitsapp',
  );
}