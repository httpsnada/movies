abstract class MovieSuggestionsEvent {}

class GetMovieSuggestions extends MovieSuggestionsEvent {
  final int movieId;

  GetMovieSuggestions(this.movieId);
}
