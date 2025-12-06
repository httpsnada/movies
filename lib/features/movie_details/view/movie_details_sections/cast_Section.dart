import 'package:flutter/material.dart';
import 'package:movies/features/movie_details/view/movie_details_sections/sectionTitle.dart';

import '../../../movies/data/cast_item.dart';
import '../../../movies/data/movie_data.dart';

class CastSection extends StatelessWidget {
  final MovieData movie;

  const CastSection({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle("Cast"),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: movie.cast.length,
          itemBuilder: (_, i) => CastItem(cast: movie.cast[i]),
        ),
      ],
    );
  }
}
