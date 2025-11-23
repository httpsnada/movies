import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Center(child: Text('Search', style: TextStyle(color: Colors.white70, fontSize: 20))),
    );
  }
}
