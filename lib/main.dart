import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_userauthentication/firebase_options.dart';
import 'package:firebase_userauthentication/home.dart';
import 'package:firebase_userauthentication/login.dart';
import 'package:firebase_userauthentication/sign.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignPage(),
    );
  }
}
