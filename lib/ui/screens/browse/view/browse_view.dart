import 'package:flutter/material.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Center(child: Text('Browse', style: TextStyle(color: Colors.white70, fontSize: 20))),
    );
  }
}
