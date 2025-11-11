import 'package:flutter/material.dart';
import 'package:proj/components/auth_field.dart';
import 'package:proj/components/default_page.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> authKey = GlobalKey();
    final TextEditingController phoneNumber = TextEditingController();
    final TextEditingController password = TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: DefaultPage(
        title: "Log In",
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: authKey,
            child: Column(
              children: [
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
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (authKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, "home");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: const Text("Log In"),
                ),
                TextButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, "forgotPassword"),
                  },
                  child: Text("Forgot password?"),
                ),

                TextButton(
                  child: Text("Don't have an account? Sign up"),
                  onPressed: () => {
                    Navigator.pushReplacementNamed(context, "register"),
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
