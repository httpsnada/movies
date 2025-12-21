import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movie_details/data/movie_details_repo.dart';
import 'package:movies/features/movie_details/view/bloc/movie_details_state.dart';
import 'package:movies/features/movie_details/view/widgets/movie_genres.dart';
import 'package:movies/features/movie_details/view/widgets/movie_headers.dart';
import 'package:movies/features/movie_details/view/widgets/movie_screenshoots.dart';
import 'package:movies/features/movie_details/view/widgets/movie_suggestions.dart';
import 'package:movies/features/movie_details/view/widgets/movie_summary.dart';
import 'package:movies/features/movie_suggestions/data/movie_suggestions_repo.dart';
import 'package:movies/features/movie_suggestions/view/bloc/movie_suggestions_bloc.dart';
import 'package:movies/features/movie_suggestions/view/bloc/movie_suggestions_event.dart';

import '../../../../../../../../core/theme/app_theme.dart';
import '../bloc/movie_details_bloc.dart';
import '../bloc/movie_details_event.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int movieId = ModalRoute.of(context)?.settings.arguments as int;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              MovieDetailsBloc(MoviesDetailsRepo())
                ..add(GetMovieDetails(movieId)),
        ),

        BlocProvider(
          create: (_) =>
              MovieSuggestionsBloc(MovieSuggestionsRepo())
                ..add(GetMovieSuggestions(movieId)),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.bookmark, size: 24, color: AppColors.white),
            ),
          ],
        ),
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return const SizedBox(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(color: AppColors.yellow),
                ),
              );
            }

            if (state is MovieDetailsLoaded) {
              final movie = state.movie;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MovieHeaders(movie: movie),
                    SizedBox(height: 12),

                    MovieScreenshots(movie: movie),
                    SizedBox(height: 12),

                    MovieSuggestions(movieId: movieId),

                    MovieSummary(movie: movie),
                    SizedBox(height: 12),

                    MovieGenres(movie: movie),
                    SizedBox(height: 12),
                  ],
                ),
              );
            }

            if (state is MovieDetailsError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
