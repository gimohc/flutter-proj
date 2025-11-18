import 'package:flutter/material.dart';
import 'package:proj/components/profile_button.dart';

class DefaultPage extends StatelessWidget {
  final String? title;
  final Widget child;
  final bool? showProfile;

  const DefaultPage({
    super.key,
    this.title,
    required this.child,
    this.showProfile = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan, useMaterial3: false),
      home: Scaffold(
        appBar: (title != null)
            ? AppBar(
                centerTitle: true,
                actions: showProfile! ? [ProfileButton()] : null,
                title: Text(title!),
              )
            : null,
        body: SizedBox(child: Center(child: child)),
      ),
    );
  }
}
