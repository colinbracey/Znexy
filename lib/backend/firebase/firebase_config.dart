import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD8c6ObN67Fy4Ub1MfyWKwuW5J-c-rht0A",
            authDomain: "helpme-502f1.firebaseapp.com",
            projectId: "helpme-502f1",
            storageBucket: "helpme-502f1.appspot.com",
            messagingSenderId: "421340456537",
            appId: "1:421340456537:web:a3464c92bc9c6e5b0a7348",
            measurementId: "G-HL97G9PJW6"));
  } else {
    await Firebase.initializeApp();
  }
}
