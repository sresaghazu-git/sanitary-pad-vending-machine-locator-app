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
    apiKey: "AIzaSyDZ_CbF_YA0bSYwjPYl2hFl8bLHsyMu_Xg",
    authDomain: "vending-machine-locator-app.firebaseapp.com",
    databaseURL: "https://vending-machine-locator-app.firebaseio.com",
    projectId: "vending-machine-locator-app",
    storageBucket: "vending-machine-locator-app.appspot.com",
    messagingSenderId: "911150925492",
    appId: "1:911150925492:android:c2d449230168b3c3c8b9e1",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyDZ_CbF_YA0bSYwjPYl2hFl8bLHsyMu_Xg",
    authDomain: "vending-machine-locator-app.firebaseapp.com",
    databaseURL: "https://vending-machine-locator-app.firebaseio.com",
    projectId: "vending-machine-locator-app",
    storageBucket: "vending-machine-locator-app.appspot.com",
    messagingSenderId: "911150925492",
    appId: "1:911150925492:android:c2d449230168b3c3c8b9e1",
  );
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyDZ_CbF_YA0bSYwjPYl2hFl8bLHsyMu_Xg",
    authDomain: "vending-machine-locator-app.firebaseapp.com",
    databaseURL: "https://vending-machine-locator-app.firebaseio.com",
    projectId: "vending-machine-locator-app",
    storageBucket: "vending-machine-locator-app.appspot.com",
    messagingSenderId: "911150925492",
    appId: "1:911150925492:android:c2d449230168b3c3c8b9e1",
  );
}
