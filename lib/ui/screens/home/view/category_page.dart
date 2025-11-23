import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final String genre;
  const CategoryPage({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(12, (i) => 'assets/images/bottom_left.png');

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(title: Text(genre), backgroundColor: Colors.transparent, elevation: 0),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .66, crossAxisSpacing: 12, mainAxisSpacing: 12),
        itemCount: items.length,
        itemBuilder: (context, i) {
          final path = items[i];
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(path, fit: BoxFit.cover),
                Container(decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black87, Colors.transparent]))),
              ],
            ),
          );
        },
      ),
    );
  }
}
