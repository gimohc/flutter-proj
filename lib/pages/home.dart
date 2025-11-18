import 'package:flutter/material.dart';
import 'package:proj/components/default_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(title: "Home", showProfile: true, child: Container());
  }
}
