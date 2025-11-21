import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 64, bottom: 32),
      child: Image.asset(
        'assets/images/logo_transparent.png',
        height: 128,
        width: 128,
      ),
    );
  }
}
