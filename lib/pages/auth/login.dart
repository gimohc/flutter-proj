import 'package:flutter/material.dart';
import 'package:proj/components/auth/auth_button.dart';
import 'package:proj/components/auth/auth_field.dart';
import 'package:proj/components/auth/google_auth.dart';
import 'package:proj/components/default_page.dart';

class Login extends StatelessWidget {
  final GlobalKey<FormState> authKey = GlobalKey();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: "Welcome back!",
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: authKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              const SizedBox(height: 24),
              AuthButton(
                text: "Log In",
                onPressed: () {
                  if (authKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, "home");
                  }
                },
              ),
              const GoogleAuth(),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "forgotPassword");
                },
                child: Text("Forgot password?"),
              ),
              TextButton(
                child: Text("Don't have an account? Sign up"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "register");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
