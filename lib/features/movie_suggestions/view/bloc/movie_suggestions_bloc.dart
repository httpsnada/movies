import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/movie_suggestions_repo.dart';
import 'movie_suggestions_event.dart';
import 'movie_suggestions_states.dart';

class MovieSuggestionsBloc
    extends Bloc<MovieSuggestionsEvent, MovieSuggestionsState> {
  final MovieSuggestionsRepo repo;

  MovieSuggestionsBloc(this.repo) : super(MovieSuggestionsInitial()) {
    on<GetMovieSuggestions>(_getSuggestions);
  }

  Future<void> _getSuggestions(
    GetMovieSuggestions event,
    Emitter<MovieSuggestionsState> emit,
  ) async {
    emit(MovieSuggestionsLoading());

    try {
      final movies = await repo.getMoviesSuggestions(event.movieId);
      emit(MovieSuggestionsLoaded(movies));
    } catch (e) {
      emit(MovieSuggestionsError(e.toString()));
    }
  }
}
