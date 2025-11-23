import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double rating;
  final double width;
  final double height;
  const MovieCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.width,
    required this.height,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
