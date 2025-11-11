import 'package:flutter/material.dart';
import 'package:proj/components/default_page.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: DefaultPage(title: "Forgot Password", child: Container()),
    );
  }
}
