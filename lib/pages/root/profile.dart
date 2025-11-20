import 'package:flutter/material.dart';
import 'package:proj/components/default_page.dart';
import 'package:proj/components/profile_option.dart';
import 'package:proj/components/profile_text.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: "Profile",
      child: ListView(
        padding: const EdgeInsets.only(bottom: 20),
        children: [
          _buildSection("Account", [
            const ProfileOption(
              icon: Icon(Icons.settings),
              text: "Account Settings",
              route: "information",
            ),
            const ProfileOption(
              icon: Icon(Icons.history),
              text: "Order History",
              route: "history",
            ),
            const ProfileOption(
              icon: Icon(Icons.location_pin),
              text: "Manage Addresses",
              route: "addresses",
            ),
            const ProfileOption(
              icon: Icon(Icons.wallet),
              text: "Wallet",
              route: "wallet",
            ),
            const ProfileOption(
              icon: Icon(Icons.dark_mode),
              text: "Change Theme",
            ),
            const ProfileOption(
              icon: Icon(Icons.language),
              text: "Change language",
            ),
          ]),

          _buildSection("About & Support", [
            const ProfileOption(
              icon: Icon(Icons.info),
              text: "Help Center",
              route: "help",
            ),
            const ProfileOption(
              icon: Icon(Icons.place),
              text: "About this application",
              route: "about",
            ),
            const ProfileOption(icon: Icon(Icons.star), text: "Rate the app"),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileText(title),
        ...options,
        const SizedBox(height: 16),
      ],
    );
  }
}
