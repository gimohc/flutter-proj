import 'package:flutter/material.dart';
import 'package:proj/components/auth/auth_button.dart';
import 'package:proj/components/auth/auth_field.dart';
import 'package:proj/components/default_page.dart';
import 'package:proj/components/headline.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  final GlobalKey<FormState> editKey = GlobalKey();

  late final TextEditingController fullName;
  late final TextEditingController phoneNumber;
  late final TextEditingController password;
  late final TextEditingController confirmPassword;
  late final TextEditingController email;

  @override
  void initState() {
    super.initState();
    phoneNumber = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    fullName = TextEditingController();
    email = TextEditingController();
  }

  @override
  void dispose() {
    phoneNumber.dispose();
    password.dispose();
    confirmPassword.dispose();
    fullName.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: "",
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: editKey,
          child: ListView(
            children: [
              const Center(child: Headline("Account Details")),

              const SizedBox(height: 20),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.cyan.withAlpha(100),
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.grey,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              AuthField(
                label: "Full name",
                controller: fullName,
                optional: true,
              ),
              AuthField(
                label: "Phone Number",
                controller: phoneNumber,
                prefix: "+962",
                enabled: false,
              ),
              AuthField(
                label: "Email",
                controller: email,
                optional: true,
                regex:
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                regexMessage: "Invalid email format",
              ),

              const SizedBox(height: 10),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AuthField(
                      label: "Password",
                      controller: password,
                      isPassword: true,
                      optional: true,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AuthField(
                      label: "Confirm Password",
                      controller: confirmPassword,
                      isPassword: true,
                      optional: true,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              AuthButton(
                text: "Update Profile",
                onPressed: () {
                  if (editKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, "home");
                  }
                },
              ),

              // Adds a bit of bottom padding so it doesn't touch the edge on small phones
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
