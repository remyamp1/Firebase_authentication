import 'package:firebase_userauthentication/home.dart';
import 'package:firebase_userauthentication/login.dart';
import 'package:firebase_userauthentication/sign.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SignPage(),
    );
  }
}