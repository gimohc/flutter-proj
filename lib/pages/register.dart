import 'package:flutter/material.dart';
import 'package:proj/components/auth_field.dart';
import 'package:proj/components/default_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final GlobalKey<FormState> authKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: "Sign Up", 
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: authKey,
          child: Column(
            children: [
              
              AuthField(
                label: "Full Name",
                controller: name,
              ),
              const SizedBox(height: 16),
              AuthField(
                label: "Phone Number",
                controller: phoneNumber,
                prefix: "+962",
              ),
              const SizedBox(height: 16),
              AuthField(
                label: "Password",
                controller: password,
                isPassword: true,
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                },
                child: const Text("Sign Up"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => {},
                child: const Text("Already have an account? Log In"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}