import 'package:flutter/material.dart';
import 'package:proj/components/auth/auth_button.dart';
import 'package:proj/components/auth/auth_field.dart';
import 'package:proj/components/auth/google_auth.dart';
import 'package:proj/components/default_page.dart';
import 'package:proj/components/headline.dart';
import 'package:proj/components/logo.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> authKey = GlobalKey();
  late final TextEditingController phoneNumber;
  late final TextEditingController password;

  @override
  void initState() {
    super.initState();
    phoneNumber = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    phoneNumber.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: authKey,
          child: ListView(
            children: [
              const Logo(),
              const Center(child: Headline("Welcome Back!")),

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

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "forgotPassword");
                  },
                  child: const Text("Forgot password?"),
                ),
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
                child: const Text("Don't have an account? Sign up"),
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
