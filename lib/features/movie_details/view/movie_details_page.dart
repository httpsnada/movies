import 'package:flutter/material.dart';

import '../../movies/data/movie_data.dart';
import 'movie_details_sections/cast_Section.dart';
import 'movie_details_sections/genres_Section.dart';
import 'movie_details_sections/header_section.dart';
import 'movie_details_sections/screenshots.dart';
import 'movie_details_sections/similar_Section.dart';
import 'movie_details_sections/status_buttons.dart';
import 'movie_details_sections/summary_Section.dart';
import 'movie_details_sections/watch_button.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as MovieData;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderSection(movie: movie),
              const SizedBox(height: 20),
              WatchButtonSection(),
              StatsButtonsSection(),
              ScreenshotsSection(movie: movie),
              SimilarSection(movie: movie),
              SummarySection(movie: movie),
              CastSection(movie: movie),
              GenresSection(movie: movie),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
