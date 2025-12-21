import 'package:flutter/material.dart';
import 'package:movies/features/movie_details/data/movie_details_model.dart';

import '../../../../core/theme/app_theme.dart';

class MovieScreenshots extends StatelessWidget {
  final MovieDetailsModel movie;

  MovieScreenshots({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Screen Shots",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 8),
          if (movie.mediumScreenshotImage1 != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                movie.mediumScreenshotImage1 ?? "",
                fit: BoxFit.fill,
                width: double.infinity,
                height: 170,
              ),
            ),
          const SizedBox(height: 12),
          if (movie.mediumScreenshotImage2 != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                movie.mediumScreenshotImage2 ?? "",
                fit: BoxFit.fill,
                width: double.infinity,
                height: 170,
              ),
            ),
          const SizedBox(height: 12),
          if (movie.mediumScreenshotImage3 != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                movie.mediumScreenshotImage3 ?? "",
                fit: BoxFit.fill,
                width: double.infinity,
                height: 170,
              ),
            ),
        ],
      ),
    );
  }
}
