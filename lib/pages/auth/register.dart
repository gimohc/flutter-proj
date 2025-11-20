import 'package:flutter/material.dart';
import 'package:proj/components/auth/auth_button.dart';
import 'package:proj/components/auth/auth_field.dart';
import 'package:proj/components/auth/google_auth.dart';
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
      title: "Create an account!",
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Form(
          key: authKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthField(label: "Full Name", controller: name),
              AuthField(
                label: "Phone Number",
                controller: phoneNumber,
                prefix: "+962",
                regex: r'^\d{9}$',
              ),
              AuthField(
                label: "Password",
                controller: password,
                isPassword: true,
              ),
              SizedBox(height: 24),
              AuthButton(
                text: "Sign Up",
                onPressed: () => {
                  if (authKey.currentState!.validate())
                    Navigator.pushReplacementNamed(context, "home"),
                },
              ),
              GoogleAuth(),
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
