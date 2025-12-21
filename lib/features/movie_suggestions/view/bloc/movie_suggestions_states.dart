import '../../../movies/data/Movies.dart';

abstract class MovieSuggestionsState {}

class MovieSuggestionsInitial extends MovieSuggestionsState {}

class MovieSuggestionsLoading extends MovieSuggestionsState {}

class MovieSuggestionsLoaded extends MovieSuggestionsState {
  final List<MoviesModel> movies;

  MovieSuggestionsLoaded(this.movies);
}

class MovieSuggestionsError extends MovieSuggestionsState {
  final String message;

  MovieSuggestionsError(this.message);
}
