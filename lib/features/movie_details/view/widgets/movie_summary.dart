import 'package:flutter/material.dart';
import 'package:movies/features/movie_details/data/movie_details_model.dart';

import '../../../../core/theme/app_theme.dart';

class MovieSummary extends StatelessWidget {
  final MovieDetailsModel movie;

  MovieSummary({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final displaySummary =
        (movie.descriptionFull == null || movie.descriptionFull!.trim().isEmpty)
        ? "No summary available"
        : movie.descriptionFull;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Summary",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 8),
          Text(
            displaySummary!,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
