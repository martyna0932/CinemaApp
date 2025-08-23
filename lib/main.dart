import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCdoFR1ZfYOUUXu_O7v9aPswzjFFBut2r4",
      authDomain: "cinema-55ec6.firebaseapp.com",
      databaseURL: "https://cinema-55ec6-default-rtdb.europe-west1.firebasedatabase.app",
      projectId: "cinema-55ec6",
      storageBucket: "cinema-55ec6.firebasestorage.app",
      messagingSenderId: "105065293447",
      appId: "1:105065293447:web:77e32146a0e708aa887a22",
      measurementId: "G-FJ79BM2CR9",
    ),
  );

  runApp(const CinemaCityClone());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Web Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Firebase Web Test')),
        body: Center(
          child: Text("Firebase działa ✅"), // po inicjalizacji wyświetlamy komunikat
        ),
      ),
    );
  }
}
