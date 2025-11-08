import 'package:flutter/material.dart';

class DefaultPage extends StatelessWidget {
  final String? title;
  final Widget child;

  const DefaultPage({super.key, this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan, useMaterial3: false),
      home: Scaffold(
        appBar: (title != null)
            ? AppBar(centerTitle: true, title: Text(title!))
            : null,
        body: SizedBox(child: Center(child: child)),
      ),
    );
  }
}
