import 'package:flutter/material.dart';
import 'package:movies/core/routes/app_routes.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/features/movies/data/Movies.dart';

class MovieCard extends StatelessWidget {
  final MoviesModel movie;
  final double? width;
  final double? height;

  const MovieCard({
    super.key,
    required this.movie,
    this.width = 146,
    this.height = 220,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.MovieDetails.routeName,
          arguments: movie,
        );
      },
      child: SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Image.network(movie.mediumCoverImage ?? "", fit: BoxFit.cover),

              Container(
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("${movie.rating} ⭐"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
