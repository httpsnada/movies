import 'package:flutter/material.dart';
import 'package:movies/features/movie_details/view/movie_details_sections/sectionTitle.dart';

import '../../../movies/data/movie_data.dart';

class ScreenshotsSection extends StatelessWidget {
  final MovieData movie;

  const ScreenshotsSection({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle("Screen Shots",),
        ...movie.screenShoots.map(
              (img) => Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(img, height: 180, width: double.infinity),
            ),
          ),
        ),
      ],
    );
  }
}
