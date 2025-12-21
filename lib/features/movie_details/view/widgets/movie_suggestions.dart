import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movie_suggestions/view/bloc/movie_suggestions_bloc.dart';
import 'package:movies/features/movie_suggestions/view/bloc/movie_suggestions_states.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../movies/view/widgets/movie_card.dart';

class MovieSuggestions extends StatelessWidget {
  final int movieId;

  const MovieSuggestions({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Similar',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 8),

          BlocBuilder<MovieSuggestionsBloc, MovieSuggestionsState>(
            builder: (context, state) {
              if (state is MovieSuggestionsLoading) {
                return const SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.yellow),
                  ),
                );
              }

              if (state is MovieSuggestionsLoaded) {
                return SizedBox(
                  height: 550,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.66,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      final movie = state.movies[index];
                      return MovieCard(
                        movie: movie,
                        width: double.infinity,
                        height: double.infinity,
                      );
                    },
                  ),
                );
              }

              if (state is MovieSuggestionsError) {
                return Center(child: Text(state.message));
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
