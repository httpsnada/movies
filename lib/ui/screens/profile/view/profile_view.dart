import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Center(child: Text('Profile', style: TextStyle(color: Colors.white70, fontSize: 20))),
    );
  }
}
