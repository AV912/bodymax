import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'Web configuration not available yet.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'Platform not supported',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGHVE6DkRxdBAsJPtNhkhCPsKhmjC34b0',
    appId: '1:232692830413:android:f7e018d5f9e96c0e811984',
    messagingSenderId: '232692830413',
    projectId: 'bodymax-70882',
    storageBucket: 'bodymax-70882.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDgshhZXG0WRC2JmfLE6CITD877buLEaxg',
    appId: '1:232692830413:ios:fa510a21d2de83db811984',
    messagingSenderId: '232692830413',
    projectId: 'bodymax-70882',
    storageBucket: 'bodymax-70882.firebasestorage.app',
    iosBundleId: 'com.moundai.bodymax',
  );
}