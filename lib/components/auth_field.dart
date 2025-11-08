import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final bool? isPassword;
  final String? regex;
  final TextEditingController controller;
  final String? regexMessage;
  final String? prefix;
  final String label;

  const AuthField({
    super.key,
    this.isPassword,
    this.regex,
    this.regexMessage,
    this.prefix,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword??false,
      controller: controller,
      decoration: InputDecoration(
        prefix: (prefix != null) ? Text(prefix!) : null,
        label: Text(label),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        if (regex != null) {
          final regExp = RegExp(regex!);
          if (!regExp.hasMatch(value)) {
            return regexMessage ?? 'Invalid format';
          }
        }
        return null;
      },
    );
  }
}
