import 'package:flutter/material.dart';
import 'package:proj/components/auth_field.dart';
import 'package:proj/components/default_page.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final GlobalKey<FormState> authKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: "Sign Up",
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Form(
          key: authKey,
          child: Column(
            children: [
              AuthField(label: "Full Name", controller: name),
              const SizedBox(height: 16),
              AuthField(
                label: "Phone Number",
                controller: phoneNumber,
                prefix: "+962",
                regex: r'^\d{9}$',
              ),
              const SizedBox(height: 16),
              AuthField(
                label: "Password",
                controller: password,
                isPassword: true,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => {
                  if (authKey.currentState!.validate())
                    Navigator.pushReplacementNamed(context, "home"),
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: Text("Sign Up"),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () => {
                  Navigator.pushReplacementNamed(context, "login"),
                },
                child: const Text("Already have an account? Log In"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
