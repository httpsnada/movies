import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/features/movie_details/data/movie_details_model.dart';

class MovieHeaders extends StatelessWidget {
  final MovieDetailsModel movie;

  const MovieHeaders({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 645,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Positioned.fill(
              //   child: Image.network(
              //     movie.mediumCoverImage ?? '',
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(movie.mediumCoverImage ?? ''),
                      fit: BoxFit.cover,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        AppColors.primary,
                        AppColors.primary.withValues(alpha: 20),
                      ],
                    ),
                  ),
                ),
              ),

              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_circle_fill_sharp,
                  color: AppColors.yellow,
                  size: 88,
                ),
              ),

              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    Text(
                      movie.titleEnglish ?? "",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      movie.year.toString() ?? "",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.white.withValues(alpha: 70),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 8),

        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.white,
            backgroundColor: AppColors.red,
          ),
          child: Text("Watch Now"),
        ),

        SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DetailsContainer(
              text: movie.likeCount.toString(),
              icon: Icons.favorite,
            ),
            DetailsContainer(
              text: movie.year.toString(),
              icon: Icons.calendar_month,
            ),
            DetailsContainer(text: movie.rating.toString(), icon: Icons.star),
          ],
        ),
      ],
    );
  }
}

class DetailsContainer extends StatelessWidget {
  final String text;
  final IconData icon;

  const DetailsContainer({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 122,
      decoration: BoxDecoration(
        color: AppColors.charcoal,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: AppColors.yellow),
          SizedBox(width: 4),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
