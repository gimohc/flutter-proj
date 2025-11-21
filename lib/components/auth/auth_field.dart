import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final bool? isPassword;
  final String? regex;
  final TextEditingController controller;
  final String? regexMessage;
  final String? prefix;
  final String label;
  final bool optional;
  final bool enabled;

  const AuthField({
    super.key,
    this.isPassword,
    this.regex,
    this.regexMessage,
    this.prefix,
    this.optional = false,
    this.enabled = true,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        enabled: enabled,
        obscureText: isPassword ?? false,
        controller: controller,
        decoration: InputDecoration(
          prefixText: (prefix != null) ? "$prefix " : null,
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.cyan, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
        validator: (value) {
          if (!optional && (value == null || value.isEmpty)) {
            return 'This field is required';
          }
          if (value != null && value.isNotEmpty && regex != null) {
            final regExp = RegExp(regex!);
            if (!regExp.hasMatch(value)) {
              return regexMessage ?? 'Invalid format';
            }
          }
          return null;
        },
      ),
    );
  }
}
