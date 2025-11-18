import 'package:flutter/material.dart';
import 'package:proj/pages/forgot_password.dart';
import 'package:proj/pages/home.dart';
import 'package:proj/pages/login.dart';
import 'package:proj/pages/profile.dart';
import 'package:proj/pages/register.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "home": (context) => Home(),
        "profile": (context) => Profile(),
        "login": (context) => Login(),
        "register": (context) => Register(),
        "forgotPassword": (context) => ForgotPassword(),
      },
      home: Login(),
    );
  }
}
