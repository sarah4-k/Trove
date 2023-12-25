import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDWkTcFePcSAfwDzjjtKN0tWWlg36naDmc",
            authDomain: "content-management-syste-fd3bb.firebaseapp.com",
            projectId: "content-management-syste-fd3bb",
            storageBucket: "content-management-syste-fd3bb.appspot.com",
            messagingSenderId: "799628828573",
            appId: "1:799628828573:web:9c52f833601feb7dac9974"));
  } else {
    await Firebase.initializeApp();
  }
}
