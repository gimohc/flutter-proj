import 'package:flutter/material.dart';
import 'package:proj/pages/auth/forgot_password.dart';
import 'package:proj/pages/profile/adresses.dart';
import 'package:proj/pages/profile/cars.dart';
import 'package:proj/pages/profile/history.dart';
import 'package:proj/pages/profile/information.dart';
import 'package:proj/pages/profile/wallet.dart';
import 'package:proj/pages/root/home.dart';
import 'package:proj/pages/auth/login.dart';
import 'package:proj/pages/root/profile.dart';
import 'package:proj/pages/auth/register.dart';
import 'package:proj/pages/support/about.dart';
import 'package:proj/pages/support/help.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan, useMaterial3: false),
      routes: {
        "home": (context) => Home(),
        "profile": (context) => Profile(),
        "login": (context) => Login(),
        "register": (context) => Register(),
        "forgotPassword": (context) => ForgotPassword(),
        "help": (context) => Help(),
        "about": (context) => About(),
        "wallet": (context) => Wallet(),
        "information": (context) => Information(),
        "history": (context) => History(),
        "addresses": (context) => Addresses(),
        "cars": (context) => Cars(),
      },
      home: Login(),
    );
  }
}
