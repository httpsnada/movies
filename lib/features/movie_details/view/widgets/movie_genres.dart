import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/features/movie_details/data/movie_details_model.dart';

class MovieGenres extends StatelessWidget {
  final MovieDetailsModel movie;

  const MovieGenres({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    List<String> genres = movie.genres ?? [];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Genres',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 8),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 12,
              childAspectRatio: 122 / 36,
            ),
            shrinkWrap: true,
            itemCount: genres.length,
            itemBuilder: (context, index) => GenresItem(text: genres[index]),
          ),
        ],
      ),
    );
  }
}

class GenresItem extends StatelessWidget {
  final String text;

  const GenresItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 122,
      decoration: BoxDecoration(
        color: AppColors.charcoal,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(vertical: 4),
      alignment: Alignment.center,
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: AppColors.white),
      ),
    );
  }
}
