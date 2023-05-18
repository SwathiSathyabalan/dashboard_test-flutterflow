import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAJPQTYTirjVmbNvZNBPLX9p-dish5Sn0U",
            authDomain: "fcmflutter-c7d3f.firebaseapp.com",
            projectId: "fcmflutter-c7d3f",
            storageBucket: "fcmflutter-c7d3f.appspot.com",
            messagingSenderId: "425533596960",
            appId: "1:425533596960:web:22d104951d753ab1a2e345"));
  } else {
    await Firebase.initializeApp();
  }
}
