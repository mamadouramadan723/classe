import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCLFQ92LAcyqjNcwxLn5KDbBeVw6af7LH4",
            authDomain: "attendance-33281.firebaseapp.com",
            projectId: "attendance-33281",
            storageBucket: "attendance-33281.appspot.com",
            messagingSenderId: "393638726228",
            appId: "1:393638726228:web:e12508d8fa754ee39dfbc1",
            measurementId: "G-9LJYJE5F78"));
  } else {
    await Firebase.initializeApp();
  }
}
