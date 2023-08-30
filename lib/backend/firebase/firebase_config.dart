import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC9QXoMGkYF6nKcFHe3YGY04_7M3kJ9u6Y",
            authDomain: "channellab-11ee7.firebaseapp.com",
            projectId: "channellab-11ee7",
            storageBucket: "channellab-11ee7.appspot.com",
            messagingSenderId: "584585150948",
            appId: "1:584585150948:web:132380ccf0a0c5fd8bc7f1",
            measurementId: "G-P3LH2KVHNR"));
  } else {
    await Firebase.initializeApp();
  }
}
