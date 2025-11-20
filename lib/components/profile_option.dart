import 'package:flutter/material.dart';

class ProfileOption extends StatelessWidget {
  final Icon? icon;
  final String text;
  final String? route;
  final VoidCallback? onTap;
  final Widget? trailing;

  const ProfileOption({
    super.key,
    this.icon,
    required this.text,
    this.route,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      leading: icon,
      onTap: () {
        if (route != null) Navigator.of(context).pushNamed(route!);
        if (onTap != null) onTap!();
      },
      trailing:
          trailing ??
          (route != null
              ? const Icon(Icons.chevron_right, color: Colors.grey)
              : null),
    );
  }
}
