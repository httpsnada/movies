import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/features/movies/data/movie_mockup.dart';

import '../../../data/movie_data.dart';
import '../../widgets/hero_carousel.dart';
import '../../widgets/movie_card.dart';
import 'movie_grid_page.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List<MovieData> movies = MovieMockup.movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          HeroCarousel(movies: movies),

          const SizedBox(height: 20),

          _buildCategory(context, title: "Action", movies: movies),

          const SizedBox(height: 20),

          _buildCategory(context, title: "Drama", movies: movies),
        ],
      ),
    );
  }

  Widget _buildCategory(
    BuildContext context, {
    required String title,
    required List<MovieData> movies,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          MoviesGridPage(title: title, movies: movies),
                    ),
                  );
                },
                child: const Text(
                  "See more → ",
                  style: TextStyle(color: AppColors.yellow),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 15),

        SizedBox(
          height: 220,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: MovieCard(movie: movies[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
