import 'package:flutter/material.dart';
import 'package:movies/features/movie_details/view/movie_details_sections/sectionTitle.dart';

import '../../../home/widgets/movie_card.dart';
import '../../../movies/data/movie_data.dart';

class SimilarSection extends StatelessWidget {
  final MovieData movie;

  const SimilarSection({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle("Similar"),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: movie.similar.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .65,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (_, i) => MovieCard(movie: movie.similar[i]),
          ),
        ),
      ],
    );
  }
}
