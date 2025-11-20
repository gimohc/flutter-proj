import 'package:flutter/material.dart';

class GoogleAuth extends StatelessWidget {
  const GoogleAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: 20),
      child: ElevatedButton(
        onPressed: () => {Navigator.of(context).pushReplacementNamed("home")},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: Colors.grey),
          ),
          elevation: 2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/google_logo.png',
              height: 24.0,
              width: 24.0,
            ),
            const SizedBox(width: 10),
            const Text('Continue with Google', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
