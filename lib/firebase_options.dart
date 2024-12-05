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
    // Add your android configuration here from google-services.json
    apiKey: 'your-api-key',
    appId: 'your-app-id',
    messagingSenderId: 'your-sender-id',
    projectId: 'your-project-id',
    storageBucket: 'your-bucket',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    // Add your iOS configuration here from GoogleService-Info.plist
    apiKey: 'your-api-key',
    appId: 'your-app-id',
    messagingSenderId: 'your-sender-id',
    projectId: 'your-project-id',
    storageBucket: 'your-bucket',
    iosClientId: 'your-client-id',
    iosBundleId: 'com.example.bodymax',
  );
}
