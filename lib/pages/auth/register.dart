import 'package:flutter/material.dart';
import 'package:proj/components/auth/auth_button.dart';
import 'package:proj/components/auth/auth_field.dart';
import 'package:proj/components/auth/google_auth.dart';
import 'package:proj/components/default_page.dart';
import 'package:proj/components/headline.dart';
import 'package:proj/components/logo.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> authKey = GlobalKey<FormState>();
  late final TextEditingController name;
  late final TextEditingController phoneNumber;
  late final TextEditingController password;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    phoneNumber = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    name.dispose();
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
              const Center(child: Headline("Register")),

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

              const SizedBox(height: 24),

              AuthButton(
                text: "Sign Up",
                onPressed: () {
                  if (authKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, "home");
                  }
                },
              ),

              const GoogleAuth(),

              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "login");
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
