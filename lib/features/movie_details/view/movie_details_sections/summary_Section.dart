import 'package:flutter/material.dart';
import 'package:movies/features/movie_details/view/movie_details_sections/sectionTitle.dart';

import '../../../movies/data/movie_data.dart';

class SummarySection extends StatelessWidget {
  final MovieData movie;

  const SummarySection({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle("Summary"),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            movie.description,
            style: const TextStyle(fontSize: 18, height: 1.5),
          ),
        ),
      ],
    );
  }
}
