import 'package:flutter/material.dart';
import 'package:movies/features/movie_details/view/movie_details_sections/sectionTitle.dart';

import '../../../movies/data/movie_data.dart';

class GenresSection extends StatelessWidget {
  final MovieData movie;

  const GenresSection({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle("Genres"),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: movie.genres.map((g) {
            return Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .08),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(g, style: const TextStyle(fontSize: 16)),
            );
          }).toList(),
        ),
      ],
    );
  }
}
