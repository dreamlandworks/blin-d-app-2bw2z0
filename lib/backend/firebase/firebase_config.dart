import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDU6JtwjB2egdQ4tWxuin_MihYufQxnc6c",
            authDomain: "blindapp-489217.firebaseapp.com",
            projectId: "blindapp-489217",
            storageBucket: "blindapp-489217.firebasestorage.app",
            messagingSenderId: "487401790901",
            appId: "1:487401790901:web:d4c972f1fa2e054b268dfc",
            measurementId: "G-V0PK18J572"));
  } else {
    await Firebase.initializeApp();
  }
}
